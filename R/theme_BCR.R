#' Custom ggplot2 Theme: BCR
#'
#' @import ggplot2
#'
#' @export
theme_BCR <- function() {
  theme_foundation(base_size = 15, base_family = "") +
    theme(
      plot.background = element_rect(fill = "white"),
      panel.background = element_rect(fill = "white"),
      line = element_line(colour = "black"),
      rect = element_rect(fill = "white", linetype = 0, colour = NA),
      axis.title = element_blank(),
      axis.ticks = element_blank(),
      axis.line = element_blank(),
      legend.background = element_rect(),
      legend.position = "bottom",
      legend.direction = "horizontal",
      legend.box = "vertical",
      panel.grid = element_line(colour = NULL),
      panel.grid.major = element_line(colour = "#D2D2D2"),
      panel.grid.minor = element_blank(),
      plot.margin = unit(c(1, 1, 1, 1), "lines"),
      strip.background = element_rect(),
      text = element_text(family = "Exo 2", colour = "#3C3C3C"),
      plot.caption = element_text(size = rel(0.7), hjust = 0),
      plot.caption.position = "plot",
      plot.tag = element_text(
        size = rel(0.8),
        hjust = c(0, 1),
        color = "#6d6f71",
        margin = margin(-10, 0, 0, 0)
      ),
      axis.text = element_text(size = rel(0.8)),
      legend.text = element_text(size = rel(0.8)),
      legend.title = element_text(size = rel(1.1), face = "bold"),
      plot.title = element_text(size = rel(1.5), face = "bold"),
      plot.title.position = "plot",
      plot.subtitle = element_text(size = rel(1.2)),
      strip.text = element_text(size = rel(0.8), face = "bold"),
      plot.tag.position = "bottom"
    )
}
