library(tidyverse)

carat_data <- read_csv("carat.csv", show_col_types = FALSE)

if (!"carat" %in% names(carat_data)) {
  stop("carat.csv must contain a 'carat' column.")
}

hist_p <- ggplot(carat_data, aes(x = carat)) +
  geom_histogram(binwidth = 0.05, fill = "#00BFC4", color = "#102A43") +
  labs(
    title = "The Shape of 50,000 Diamonds",
    subtitle = "Carat weight distribution",
    x = "Carat weight",
    y = "Number of diamonds"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.background = element_rect(fill = "#F0F7FA", color = NA),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold", color = "#102A43")
  )

ggsave(
  file = "diamonds.png",
  plot = hist_p,
  width = 10,
  height = 6,
  dpi = 300
)
