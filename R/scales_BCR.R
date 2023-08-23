#' Custom Color Scale for theme_BCR
#'
#' @import ggplot2
#'
#' @param palette The name of the color palette.
#' @param n_colors The number of colors in the scale.
#' @return A color scale.
#'
#' @export
scale_color_BCR <- function(palette = "main", n_colors = 1) {
  custom_colors <- list(
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

  custom_palettes <- list(
    main = c(green, blue, purple, orange, siam, yellow, pink, gray, red, brown, black),
    forest = c(green, siam, yellow, brown, orange, gray),
    wetland = c(blue, purple, siam, gray, black),
    urban = c(red, pink, gray, brown, black),
    mountains = c(purple, orange, pink, yellow, red, brown),
  )

  if (palette %in% names(custom_palettes)) {
    colors <- custom_palettes[[palette]]
  } else {
    stop(
      "Invalid palette name. Choose from: ",
      paste(names(custom_palettes), collapse = ", ")
    )
  }

  if (n_colors > 1) {
    scale_color_manual(values = rep(colors, n_colors))
  } else {
    scale_color_manual(values = colors)
  }
}
