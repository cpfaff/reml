#' Get metadata either from an URL or local EML file
#'
#' @param eml_url The full URL to a an EML file
#' @param eml_path The path to an EML file
#'
#' @return A list of structured metadata. metadata that doesn't exist is represented as \code{NA}
#' @import XML
#' @export
#'

eml.read <- function(eml_url, eml_path) {
  if (!missing(eml_path)) eml_url = eml_path
  eml = xmlParse(eml_url)
 
  if(xmlSize(getNodeSet(eml, "//dataset"))) {
    dataset_field_values = rapply(dataset, function(x) xmlNodesValue(path=x, doc=eml), how="replace") 
    return(dataset_field_values)
  } else {
    warning("There is no nodeset for dataset") 
  }

  if(xmlSize(getNodeSet(eml, "//citation"))) {
     citation_field_values = rapply(dataset, function(x) xmlNodesValue(path=x, doc=eml), how="replace") 
    return(citation_field_values)
  } else {
    warning("There is no nodeset for citation") 
  }
} 

    # out$creators = as.data.frame(out$creators, stringsAsFactors=F) 
    # out$contacts = as.data.frame(out$contacts, stringsAsFactors=F) 

    # attributeList = getNodeSet(eml, path="//attributeList/attribute")

    # column_template = list(header = "./attributeLabel", description = "./attributeDefinition", unit = ".//unit") 

    # columns = lapply(column_template, function(c) { 
      # sapply(attributeList, function(d) {
        # xmlNodesValue(doc=d, path=c)
      # })
    # })

    # columns = as.data.frame(columns, stringsAsFactors=F)

    # if (nrow(columns)) {
      # columns$unit = as.character(columns$unit)
      # columns$unit[is.na(columns$unit) | columns$unit == "dimensionless"] = "dimensionless"
      # out$columns = columns
    # }
