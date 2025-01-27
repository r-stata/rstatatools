#' @title Add water mark for Geodatasci 
#' @import magick
#' @param file image file path
#' @param mode light or dark
#' @param replace TRUE or FALSE
#' @export
addrswm2 <- function(file, mode = "light", replace = TRUE) {
  stopifnot(file.exists(file))
  stopifnot(mode %in% c("light", "dark"))
  wmurl <- if_else(mode == "light",
                   system.file("watermark2.png", package = "rstatatools"),
                   system.file("watermark-white2.png", package = "rstatatools"))

  image_read(file) -> img
  info <- image_info(img)
  width <- info$width
  height <- info$height

  image_read(wmurl) %>%
    image_fx(expression = "a*0.2", channel = "alpha") %>%
    image_crop(paste0(width, "x", height, "+0+0")) -> new_wm

  if (replace == TRUE) {
    image_mosaic(c(img, new_wm)) %>%
      magick::image_write(file)
  } else {
    image_mosaic(c(img, new_wm)) %>%
      magick::image_write(paste0("new_", basename(file)))
  }
}
