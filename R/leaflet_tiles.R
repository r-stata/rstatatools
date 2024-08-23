#' @title Load Tiandi Map to leaflet
#'
#' @description Simple function like addTiles()
#' @import leaflet
#'
#' @param map A leaflet object.
#' @param type A character value to set type of Tiandi map tiles. Options are "normal", "satellite", "terrain".
#' @param ... Other paramter pass to the addTiles. function
#'
#' @examples
#' library(leaflet)
#' library(leafem)
#' library(rstatatools)
#' library(sf)
#' if(interactive()){
#'   leaflet() %>%
#'     tdtmap(type = "terrain") %>%
#'     addFeatures(locsf, weight = 0.1, radius = 0.1)
#' }
#' @export
tdtmap <- function (map, type = "normal", ...) {
  stopifnot(type %in% c("normal", "satellite", "terrain"))
  key = "93724b915d1898d946ca7dc7b765dda5"
  url = paste0("http://t1.tianditu.com/DataServer?T=vec_w&X={x}&Y={y}&L={z}&tk=", key)
  if (type == "satellite") {
    url = paste0("http://t1.tianditu.com/DataServer?T=img_w&X={x}&Y={y}&L={z}&tk=", key)
  }
  if (type == "terrain") {
    url = paste0("http://t1.tianditu.com/DataServer?T=ter_w&X={x}&Y={y}&L={z}&tk=", key)
  }

  leaflet::addTiles(map, url,
                    leaflet::tileOptions(tileSize = 256, minZoom = 3, maxZoom = 17, zoomOffset = 1), ...)
}

#' @title Load Tiandi Map annotion to leaflet
#'
#' @description Simple function like addTiles()
#' @import leaflet
#'
#' @param map A leaflet object.
#' @param ... Other paramter pass to the addTiles function.
#'
#' @examples
#' library(leaflet)
#' library(leafem)
#' library(rstatatools)
#' library(sf)
#' if(interactive()){
#'   leaflet() %>%
#'     tdtmap(type = "terrain") %>%
#'     tdtmap_annotion() %>%
#'     addFeatures(locsf, weight = 0.1, radius = 0.1)
#' }
#'
#' @export
tdtmap_annotion <- function (map,...) {
  leaflet::addTiles(map, "http://t1.tianditu.com/DataServer?T=cia_w&X={x}&Y={y}&L={z}&tk=93724b915d1898d946ca7dc7b765dda5",
                    leaflet::tileOptions(tileSize = 256, minZoom = 3, maxZoom = 17), ...)
}

#' @title Load GaoDe Map to leaflet
#'
#' @description Simple function like addTiles()
#' @import leaflet
#'
#' @param map A leaflet object.
#' @param type A character value to set type of Gaode map tiles. Options are "normal" and "satellite".
#' @param ... Other paramter pass to the addTiles. function
#'
#' @examples
#' library(leaflet)
#' library(leafem)
#' library(rstatatools)
#' library(sf)
#' if(interactive()){
#'   leaflet() %>%
#'     gdmap(type = "satellite") %>%
#'     addFeatures(locsf, weight = 0.1, radius = 0.1)
#' }
#'
#' @export
gdmap <- function (map, type = "normal", ...) {
  stopifnot(type %in% c("normal", "satellite"))
  if (type == "normal") {
    url = "http://webrd01.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}"
  }
  if (type == "satellite") {
    url = "http://webst01.is.autonavi.com/appmaptile?style=6&x={x}&y={y}&z={z}"
  }
  leaflet::addTiles(map, url,
                    leaflet::tileOptions(tileSize = 256, minZoom = 3, maxZoom = 17), ...)
}

#' @title Load GaoDe Map annotion to leaflet
#'
#' @description Simple function like addTiles()
#' @import leaflet
#'
#' @param map A leaflet object.
#' @param ... Other paramter pass to the addTiles. function
#'
#' @examples
#' library(leaflet)
#' library(leafem)
#' library(rstatatools)
#' library(sf)
#' if(interactive()){
#'   leaflet() %>%
#'     gdmap(type = "satellite") %>%
#'     gdmap_annotion() %>%
#'     addFeatures(locsf, weight = 0.1, radius = 0.1)
#' }
#'
#' @export
gdmap_annotion <- function (map, ...)
{
  leaflet::addTiles(map, "http://webst01.is.autonavi.com/appmaptile?style=8&x={x}&y={y}&z={z}",
                    leaflet::tileOptions(tileSize = 256, minZoom = 3, maxZoom = 17), ...)
}

#' @title Load Geoq Map to leaflet
#'
#' @description Superseded!
#'
#' @export
geoqmap <- function (map, type = "normal", ...) {
  stop("geoqmap() was superseded!")
}
