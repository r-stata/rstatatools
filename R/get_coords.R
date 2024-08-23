transform_lon <- function(lon, lat) {
  dlon = 300.0 + lon + 2.0 * lat + 0.1 * lon * lon +
    0.1 * lon * lat + 0.1 * sqrt(abs(lon)) +
    (20.0 * sin(6.0 * lon * pi) + 20.0 * sin(2.0 * lon * pi)) *
    2.0 / 3.0 + (20.0 * sin(lon * pi) + 40.0 * sin(lon / 3.0 * pi)) *
    2.0 / 3.0 + (150.0 * sin(lon / 12.0 * pi) + 300.0 * sin(lon / 30.0 * pi)) *
    2.0 / 3.0
  return(dlon)
}
transform_lat <- function(lon, lat) {
  dlat = -100.0 + 2.0 * lon + 3.0 * lat + 0.2 * lat * lat +
    0.1 * lon * lat  + 0.2 * sqrt(abs(lon)) +
    (20.0 * sin(6.0 * lon * pi) + 20.0 * sin(2.0 * lon * pi)) *
    2.0 / 3.0 + (20.0 * sin(lat * pi) + 40.0 * sin(lat / 3.0 * pi)) *
    2.0 / 3.0 + (160.0 * sin(lat / 12.0 * pi) + 320 * sin(lat * pi / 30.0)) *
    2.0 / 3.0
  return(dlat)
}
#' @export
GCJ02_WGS84 <- function(lon, lat) {
  pi <- 3.1415926535897932384626
  a <- 6378245
  ee <- 0.00669342162296594323
  dlon = transform_lon(lon - 105, lat - 35)
  dlat = transform_lat(lon - 105, lat - 35)
  radlat = lat / 180.0 * pi
  magic = 1 - ee * (sin(radlat))^2
  sqrtMagic = sqrt(magic)
  dlon = (dlon * 180.0) / (a / sqrtMagic * cos(radlat) * pi)
  dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi)
  mglon = lon + dlon
  mglat = lat + dlat
  lon <- (lon * 2 - mglon)
  lat <- (lat * 2 - mglat)
  return(paste(lon, lat, sep = ","))
}

#' @title Geocode with Gaodemap(amap)
#' @param address just address
#' @param key amap key, Sys.getenv("amap.key") as default.
#' @param city city, default if NULL
#' @importFrom jsonlite fromJSON
#' @importFrom stringr str_split
#' @export
get_coords <- function(address, city = NULL, key = Sys.getenv("amap.key")){
  if (is.null(city)) {
    jsonlite::fromJSON(paste0('https://restapi.amap.com/v3/geocode/geo?address=', address,
                    '&key=', key)) -> temp
  } else {
    jsonlite::fromJSON(paste0('https://restapi.amap.com/v3/geocode/geo?address=', address,
                    '&key=', key, "&city=", city)) -> temp
  }
  as.numeric(unlist(stringr::str_split(temp$geocodes$location, ","))) -> vct
  return(GCJ02_WGS84(lon = vct[1], lat = vct[2]))
}

#' @title Geocode with Baidumap
#' @param address just address
#' @param key Baidu key, Sys.getenv("baidumap.key") as default.
#' @param city city, default if NULL
#' @importFrom jsonlite fromJSON
#' @importFrom stringr str_split
#' @export
get_coords_bd <- function(address, city = NULL, key = Sys.getenv("baidumap.key")){
  if (is.null(city)) {
    jsonlite::fromJSON(paste0("https://api.map.baidu.com/geocoding/v3/?address=",
                              address,
                              "&output=json&ak=", key,
                              "&ret_coordtype=gcj02ll")) -> temp
  } else {
    jsonlite::fromJSON(paste0("https://api.map.baidu.com/geocoding/v3/?address=",
                              address,
                              "&output=json&ak=", key,
                              "&ret_coordtype=gcj02ll&city=", city)) -> temp
  }
  return(GCJ02_WGS84(lon = temp$result$location$lng, lat = temp$result$location$lat))
}
