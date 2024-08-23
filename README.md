
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rstatatools

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

欢迎使用
rstatatools，这个包里的函数并没有统一的目标，而是我平常使用的各种函数的集合，由于
R
包的开发不能使用中文，我又懒得写注释，所以就随便写写介绍，大家试着理解下。

欢迎大家关注微信公众号“RStata” 和 “Stata 中文社区” 获取最新资讯和动态！

| RStata | Stata中文社区 |
|:--:|:--:|
| <img src="https://mdniceczx.oss-cn-beijing.aliyuncs.com/image_20201120143454.png" width="50%"/> | <img src="https://mdniceczx.oss-cn-beijing.aliyuncs.com/image_20201120143508.png" width="50%"/> |

## 安装方法

你可以从 GitHub 上安装这个 R 包：

``` r
devtools::install_github('r-stata/rstatatools')
```

## 使用介绍

> 注意：geoqmap()、cntrade()、plotstock() 不再能使用了。

- `GCJ02_WGS84()`: GCJ02 坐标系转 WGS84 坐标系；
- `addrswm()`: 给图片添加微信公众号 RStata 水印；
- `cn_ngrams()`: 中文文本的 n-grams 分词 token 函数，用于
  tidyr::unnest_token() 函数里面；
- `cnseg_tokenfun()`: 中文文本的分词 token 函数，用于
  tidyr::unnest_token() 函数里面；
- `cntrade()`: 不再可用；
- `gdmap()`: 高德地图的瓦片图层，leaflet 相关；
- `gdmap_annotion()`: 高德地图的瓦片图层，leaflet 相关；
- `geoqmap()`: 不再可用；
- `get_coords()`: 使用高德地图进行地理编码；
- `get_coords_bd()`: 使用百度地图进行地理编码；
- `plotstock()`: 不再可用
- `tdtmap()`: 天地图的瓦片图层，leaflet 相关；
- `tdtmap_annotion()`: 天地图的瓦片图层，leaflet 相关；

------------------------------------------------------------------------

<h4 align="center">

License
</h4>

<h6 align="center">

MIT © 微信公众号 RStata
</h6>
