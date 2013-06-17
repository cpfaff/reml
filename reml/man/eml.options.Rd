\name{eml.options}
\alias{eml.options}
\title{Set or query otions related to the emldata R package.}
\usage{
  eml.options(...)
}
\arguments{
  \item{\dots}{similar to \code{\link{options}}. see
  examples below.}
}
\description{
  This function is used to query and set R emldata package
  specific options like the URL to the emldata portal and
  the URL to the tematres thesaurus.
}
\examples{
# emldata URL
eml.options('')
eml.options(url='http://www.example.com')
#Tematres URL
eml.options('temtres_url')
eml.options(tematres_url="http://www.example.com")
}

