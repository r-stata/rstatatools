## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(rstatatools)

## -----------------------------------------------------------------------------
library(leaflet)
library(leafem)
library(rstatatools)
library(sf)
leaflet() %>%
  tdtmap(type = "terrain") %>%
  addFeatures(locsf, weight = 0.1, radius = 0.1)

## -----------------------------------------------------------------------------
leaflet() %>%
  tdtmap(type = "terrain") %>%
  tdtmap_annotion() %>% 
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  gdmap() %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  gdmap(type = "satellite") %>%
  gdmap_annotion() %>% 
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap() %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "PurplishBlue") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "Gray") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "Warm") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "ENG") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "LabelAndBoundaryLine") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "Subway") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "WorldHydroMap") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "Gray_OnlySymbol") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "Gray_Reference") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "PurplishBlue_OnlySymbol") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "PurplishBlue_Reference") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "Warm_OnlySymbol") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

## -----------------------------------------------------------------------------
leaflet() %>%
  geoqmap(type = "Warm_Reference") %>%
  addFeatures(locsf, weight = 0.1, 
              radius = 0.1, color = "red")

