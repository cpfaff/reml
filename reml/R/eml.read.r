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

  template = list( 

    title = "//dataset/title", 

    creators = list(
      salutation = "//creator/individualName/salutation",
      givenName = "//creator/individualName/givenName",
      surName = "//creator/individualName/surName",
      electronicMailAddress = "//creator/electronicMailAddress",
      organizationName = "//creator/organizationName",
      deliveryPoint = "//creator/address/deliveryPoint",
      city = "//creator/address/city",
      administrativeArea = "//creator/address/administrativeArea",
      postalCode = "//creator/address/postalCode",
      country = "//creator/address/postalCode",
      phone = "//creator/phone[@phonetype='voice']",
      fax = "//creator/phone[@phonetype='fax']",
      electronicMailAddress = "//creator/electronicMailAddress",
      onlineUrl = "//creator/onlineUrl"),

      associatedParty = list(
        references = "//dataset/associatedParty/references", 
        role = "//dataset/associatedParty/role"),

      abstract = "//dataset/abstract",  

      keywords = "//keywordSet/keyword",  

      contacts = list( 
        salutation = "//contact/individualName/salutation",
        givenName = "//contact/individualName/givenName",
        surName = "//contact/individualName/surName",
        electronicMailAddress = "//contact/electronicMailAddress",
        organizationName = "//contact/organizationName",
        deliveryPoint = "//contact/address/deliveryPoint",
        city = "//contact/address/city",
        administrativeArea = "//contact/address/administrativeArea",
        postalCode = "//contact/address/postalCode",
        country = "//contact/address/postalCode",
        phone = "//contact/phone[@phonetype='voice']",
        fax = "//contact/phone[@phonetype='fax']",
        electronicMailAddress = "//contact/electronicMailAddress",
        onlineUrl = "//contact/onlineUrl"),

      samplingDescription = "//dataset//samplingDescription",  

      intellectualRights = "//dataset/intellectualRights", 

      # coverage  

      geographicCoverage = list(
        geographicDescription = "//geographicCoverage/geographicDescription",
        boundingCoordinates = c(westBoundingCoordinate = "//geographicCoverage/boundingCoordinates/westBoundingCoordinate",
          eastBoundingCoordinate = "//geographicCoverage/boundingCoordinates/eastBoundingCoordinate",
          northBoundingCoordinate = "//geographicCoverage/boundingCoordinates/northBoundingCoordinate",
          southBoundingCoordinate = "//geographicCoverage/boundingCoordinates/southBoundingCoordinate")),  

      temporalCoverage = list(
        beginDate = "//temporalCoverage//beginDate", 
        endDate = "//temporalCoverage//endDate"
      ),
      
      taxonomicSystem = list( 
        title = "//coverage//taxonomicCoverage//title", 
        creator = "//coverage//taxonomicCoverage//creator",
        publicationDate = "//coverage//taxonomicCoverage//pubDate", 
        journal = "//coverage//taxonomicCoverage//journal",
        volume = "//coverage//taxonomicCoverage//volume",
        issue = "//coverage//taxonomicCoverage//issue",
        pageRange = "//coverage//taxonomicCoverage//pageRange",
        publisher = "//coverage//taxonomicCoverage//publisher", 
        identifierName = "//coverage//taxonomicCoverage//identifierName",
        taxonomicProcedures = "//coverage//taxonomicCoverage//taxonomicProcedures"
      ),  

      taxonomicClassification = "//taxonomicClassification"
    ) 

    out = rapply(template, function(x) xmlNodesValue(path=x, doc=eml), how="replace") 

    out$creators = as.data.frame(out$creators, stringsAsFactors=F) 
     
    out$contacts = as.data.frame(out$contacts, stringsAsFactors=F) 

    attributeList = getNodeSet(eml, path="//attributeList/attribute")

    column_template = list(header = "./attributeLabel", description = "./attributeDefinition", unit = ".//unit") 

    columns = lapply(column_template, function(c) { 
      sapply(attributeList, function(d) {
        xmlNodesValue(doc=d, path=c)
      })
    })

    columns = as.data.frame(columns, stringsAsFactors=F)

    if (nrow(columns)) {
      columns$unit = as.character(columns$unit)
      columns$unit[is.na(columns$unit) | columns$unit == "dimensionless"] = "dimensionless"
      out$columns = columns
    }
    return(out)
}
