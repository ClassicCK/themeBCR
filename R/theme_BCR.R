#' Custom ggplot2 Theme: BCR
#' Theme inspired by Bird Conservancy of the Rockies
#'
#' \href{https://birdconservancy.org}{Bird Conservancy of the Rockies}.
#'
#' @family themes BCR
#' @import ggplot2
#'
#' @export
themeBCR <- function() {
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
        margin = margin(-10, 0, 0, 0)),
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

#' BCR color palette
#'
#' The standard color palette for line plots
#'
#' @family colour BCR
#' @export
bcr_pal <- function() {
  colors <- c("#9CB464", "#7CA4B4", "#B46474", "#7C64B4", "#5C6454", "#B48C7C", "#A464B4", "#B4A87C", "#80786C", "#999999", "#222222")
  values <- c(green, blue, red, purple, siam, orange, lilac, gold, brown, gray, black)
  max_n <- length(values)
  f <- manual_pal(values)
  attr(f, "max_n") <- max_n
  f
}

#' BCR color scales
#'
#' Color scales using the colors in the BCR color palette.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @family colour BCR
#' @rdname scale_BCR
#' @export
scale_colour_BCR <- function(...) {
  discrete_scale("colour", "economist", bcr_pal(), ...)
}

#' @rdname scale_BCR
#' @export
scale_color_BCR <- scale_colour_BCR

#' @rdname scale_BCR
#' @export
scale_fill_BCR <- function(...) {
  discrete_scale("fill", "economist", bcr_pal(), ...)
}
