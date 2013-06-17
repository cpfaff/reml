#' Set or query otions related to the reml package.
#'
#' This function is used to query and set the reml package specific options
#' like the download folrder or the specification location and version.
#'
#' @param \dots similar to \code{\link{options}}.
#'
#' @examples # emldata URL eml.options('')
#' eml.options(download_folder='foldername')
#'
#' @export

eml.options = function(...) {
  lst = list(...)
  .eml.opts = .eml.env$.eml.opts
  if (length(lst)) {
    if (is.null(names(lst)) && !is.list(lst[[1]])) {
      lst = unlist(lst)
      if (length(lst) == 1) .eml.opts[[lst]] else .eml.opts[lst]
    }
    else {
      omf = .eml.opts
      if (is.list(lst[[1]]))
        lst = lst[[1]]
      if (length(lst) > 0) {
        .eml.opts[names(lst)] = lapply(lst, gsub, pattern = "\\s", replacement="")
        .eml.env$.eml.opts = .eml.opts
      }
      invisible(omf)
    }
  }
  else {
    .eml.opts
  }
}

.eml.env = new.env()
