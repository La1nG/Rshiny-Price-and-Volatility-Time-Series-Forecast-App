###Data Fetching###



library(quantmod)
library(TTR)
library(zoo)
library(dplyr)
library(tidyr)
library(fredr)
library(lubridate)
library(purrr)

fetch_asset_data <- function(symbol, asset_type, start_date, end_date) {
  tryCatch({
    if (asset_type %in% c("stock", "index")) {
      df <- getSymbols(symbol, src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)
      df <- data.frame(Date = index(df), Price = as.numeric(Cl(df)), Volume = as.numeric(Vo(df)), Symbol = symbol)
    } else if (asset_type == "forex") {
      df <- getFX(symbol, from = start_date, to = end_date, auto.assign = FALSE)
      df <- data.frame(Date = index(df), Price = as.numeric(df[, 1]), Symbol = symbol)
    } else if (asset_type == "crypto" || asset_type == "commodity") {
      df <- getSymbols(symbol, src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)
      df <- data.frame(Date = index(df), Price = as.numeric(Cl(df)), Volume = if ("Vo" %in% names(df)) as.numeric(Vo(df)) else NA_real_, Symbol = symbol)
    } else {
      stop("Unsupported asset type")
    }
    df
  }, error = function(e) {
    warning(paste("Failed to fetch data for", symbol, ":", e$message))
    NULL
  })
}

clean_data <- function(df) {
  df <- df %>%
    mutate(Date = as.Date(Date)) %>%
    arrange(Date) %>%
    group_by(Symbol) %>%
    mutate(
      Price = na.approx(Price, na.rm = FALSE),
      Volume = if ("Volume" %in% names(df)) na.approx(Volume, na.rm = FALSE) else NA_real_
    ) %>%
    ungroup() %>%
    drop_na(Price)
  
  df <- df %>%
    group_by(Symbol) %>%
    mutate(z_score = (Price - mean(Price, na.rm = TRUE)) / sd(Price, na.rm = TRUE)) %>%
    filter(abs(z_score) < 3) %>%
    select(-z_score) %>%
    ungroup()
  
  df
}

engineer_features <- function(df) {
  df <- df %>%
    group_by(Symbol) %>%
    arrange(Date) %>%
    mutate(
      SMA_20 = if (n() >= 20) SMA(Price, n = 20) else rep(NA_real_, n()),
      EMA_20 = if (n() >= 20) EMA(Price, n = 20) else rep(NA_real_, n()),
      RSI_14 = if (n() >= 14) RSI(Price, n = 14) else rep(NA_real_, n())
    ) %>%
    ungroup()
  
  df <- df %>%
    group_by(Symbol) %>%
    arrange(Date) %>%
    group_split() %>%
    map_df(~{
      .x <- arrange(.x, Date)
      n_rows <- nrow(.x)
      
      pad_with_na <- function(indicator, target_length) {
        if (length(indicator) < target_length) {
          c(rep(NA_real_, target_length - length(indicator)), indicator)
        } else {
          indicator
        }
      }
      
      if (n_rows >= 26) {
        macd_result <- MACD(.x$Price)
        .x$MACD_signal <- pad_with_na(as.numeric(macd_result[, "signal"]), n_rows)
      } else {
        .x$MACD_signal <- rep(NA_real_, n_rows)
      }
      
      if (n_rows >= 20) {
        bb_result <- BBands(.x$Price)
        .x$BB_upper <- pad_with_na(as.numeric(bb_result[, "up"]), n_rows)
        .x$BB_lower <- pad_with_na(as.numeric(bb_result[, "dn"]), n_rows)
      } else {
        .x$BB_upper <- rep(NA_real_, n_rows)
        .x$BB_lower <- rep(NA_real_, n_rows)
      }
      
      return(.x)
    })
  
  return(df)
}

integrate_calendar_and_economic_data <- function(df, symbol, asset_type) {
  if (asset_type == "stock") {
    df$Earnings_Date <- NA
  }
  
  if (asset_type %in% c("stock", "index")) {
    fredr_set_key("YOUR_FRED_API_KEY")
    gdp <- tryCatch(
      fredr(series_id = "GDP", observation_start = min(df$Date), observation_end = max(df$Date)) %>%
        rename(Date = date, GDP = value) %>%
        select(Date, GDP),
      error = function(e) NULL
    )
    
    if (!is.null(gdp)) {
      df <- df %>% left_join(gdp, by = "Date")
    } else {
      df$GDP <- NA_real_
    }
  }
  df
}

process_asset_data <- function(symbol, asset_type, start_date, end_date) {
  df <- fetch_asset_data(symbol, asset_type, start_date, end_date)
  if (is.null(df)) return(NULL)
  
  df <- clean_data(df)
  if (nrow(df) == 0) return(NULL)
  
  df <- engineer_features(df)
  if (nrow(df) == 0) return(NULL)
  
  df <- integrate_calendar_and_economic_data(df, symbol, asset_type)
  
  df
}
