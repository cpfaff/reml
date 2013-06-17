\name{eml.options}
\alias{eml.options}
\title{Set or query otions related to the reml package.}
\usage{
  eml.options(...)
}
\arguments{
  \item{\dots}{similar to \code{\link{options}}.}
}
\description{
  This function is used to query and set the reml package
  specific options like the download folrder or the
  specification location and version.
}
\examples{
# emldata URL eml.options('')
eml.options(download_folder='foldername')
}

