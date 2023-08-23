#' Custom ggplot2 Theme: BCR
#' Theme inspired by Bird Conservancy of the Rockies
#'
#' \href{https://birdconservancy.org}{Bird Conservancy of the Rockies}.
#'
#' Foundation Theme
#'
#' This theme is designed to be a foundation from which to build new
#' themes, and not meant to be used directly. \code{theme_foundation()}
#' is a complete theme with only minimal number of elements defined.
#' It is easier to create new themes by extending this one rather
#' than \code{\link[ggplot2]{theme_gray}()} or \code{\link[ggplot2]{theme_bw}()},
#' because those themes define elements deep in the hierarchy.
#'
#' This theme takes \code{\link[ggplot2]{theme_gray}()} and sets all
#' \code{colour} and \code{fill} values to \code{NULL}, except for the top-level
#' elements (\code{line}, \code{rect}, and \code{title}), which have
#' \code{colour = "black"}, and \code{fill = "white"}. This leaves the spacing
#' and-non colour defaults of the default \pkg{ggplot2} themes in place.
#'
#' @inheritParams ggplot2::theme_grey
#'
#' @family themes
#' @export
#' @importFrom ggplot2 theme_grey
theme_foundation <- function(base_size=12, base_family="") {
  thm <- theme_grey(base_size = base_size, base_family = base_family)
  for (i in names(thm)) {
    if ("colour" %in% names(thm[[i]])) {
      thm[[i]]["colour"] <- list(NULL)
    }
    if ("fill" %in% names(thm[[i]])) {
      thm[[i]]["fill"] <- list(NULL)
    }
  }
  thm + theme(panel.border = element_rect(fill = NA),
              legend.background = element_rect(colour = NA),
              line = element_line(colour = "black"),
              rect = element_rect(fill = "white", colour = "black"),
              text = element_text(colour = "black"))
}
#'
#' @family themes BCR
#' @param base_size The base font size.
#' @param base_family The base font family.
#' @import ggplot2
#'
#' @export
#' @importFrom grid unit
themeBCR <- function() {
  theme_foundation(base_size = 15, base_family = c("Exo 2", "sans-serif")) +
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
      text = element_text(family = base_family, colour = "#3C3C3C"),
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
colors_BCR <- list(
pink = "#A464B4",
orange = "#B48C7C",
gray = "#999999",
red = "#B46474",
purple = "#7C64B4",
green = "#9CB464",
blue = "#7CA4B4",
siam = "#5C6454",
yellow = "#B4A87C",
black = "#222222",
brown = "#80786C"
)

bcr_pal <- function() {
  colors <- list(
    green = "#9CB464",
    blue = "#7CA4B4",
    red = "#B46474",
    purple = "#7C64B4",
    siam = "#5C6454",
    orange = "#B48C7C",
    lilac = "#A464B4",
    gold = "#B4A87C",
    brown = "#80786C",
    gray = "#999999",
    black = "#222222")
  values <- unname(colors[c('green', 'blue', 'red', 'purple', 'siam', 'orange', 'lilac', 'gold', 'brown', 'gray', 'black')])
  max_n <- length(values)
  f <- scales::manual_pal(values)
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
