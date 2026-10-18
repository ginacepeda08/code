library(tidyverse)

diamonds_url <- "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/diamonds.csv"
diamonds <- read_csv(diamonds_url, show_col_types = FALSE)

if (nrow(diamonds) < 50000) {
  stop("The downloaded dataset contains fewer than 50,000 diamonds.")
}

carat_data <- diamonds |>
  select(carat) |>
  slice_head(n = 50000)

write_csv(carat_data, "carat.csv")
