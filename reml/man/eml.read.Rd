\name{eml.read}
\alias{eml.read}
\title{Get metadata either from an URL or local EML file}
\usage{
  eml.read(eml_url, eml_path)
}
\arguments{
  \item{eml_url}{The full URL to a an EML file}

  \item{eml_path}{The path to an EML file}
}
\value{
  A list of structured metadata. metadata that doesn't
  exist is represented as \code{NA}
}
\description{
  Get metadata either from an URL or local EML file
}

