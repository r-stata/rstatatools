#' @title Chinese text's segment token function
#' @param x just x...
#' @param ... other parameters
#' @import jiebaR
#' @export
cnseg_tokenfun <- function(x, ...) {
  engine_s <- jiebaR::worker(stop_word = system.file("stopwords.txt", package = "rstatatools"),
                     user = system.file("dictionary.txt", package = "rstatatools"))
  lapply(x, jiebaR::segment, jiebar = engine_s, ...)
}

#' @title Chinese text's n-gram token function
#' @param n default is 2
#' @param x just x...
#' @param n_min just n_min...
#' @param ... other parameters
#' @import tokenizers
#' @import jiebaR
#' @export
cn_ngrams <- function(x, n = 2, n_min = n, ...) {
  engine_s <- jiebaR::worker(stop_word = system.file("stopwords.txt", package = "rstatatools"),
                             user = system.file("dictionary.txt", package = "rstatatools"))
  lapply(x, function(x){
    lapply(x, function(x, ...){
      segment(x, jiebar = engine_s, ...)
    }) %>%
      tokenizers:::generate_ngrams_batch(ngram_max = n, ngram_min = n_min) %>%
      unlist()
  })
}
