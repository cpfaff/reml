\name{eml.read}
\alias{eml.read}
\title{Get the metadata from a eml file}
\usage{
  eml.read(eml_url, eml_path)
}
\arguments{
  \item{eml_url}{The full URL to a file}

  \item{eml_path}{The path to a eml file}
}
\value{
  A list of structured metadata. metadata that doesn't
  exist is represented as \code{NA}
}
\description{
  Fetch metadata from an URL or file.
}

