# Wrapper to return NA if xmlValue not there (thanks manxingxing)
xmlNodesValue <- function(doc, path){
  out = xpathSApply(doc, path, xmlValue, trim=T, ignoreComments=T)
  out = Filter(function(x) x!="", out)
  if (length(out) == 0) return(NA)
  out
}

# Helper that determines if internet connection is available
internet_connected <- function() {
  if (.Platform$OS.type == "windows") {
    ipmessage <- system("ipconfig", intern = TRUE)
  } else {
    ipmessage <- system("ifconfig", intern = TRUE)
  }
  validIP <- "((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)[.]){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
  if(!any(grep(validIP, ipmessage[-grep("127.0.0.1", ipmessage)]))) {
    stop("Sorry not internet connection. Please connect first!")
  }
}

# Check if the document is valid according to the schema
xml_validation <- function(schema = NULL, document = NULL) {
  xsd = xmlTreeParse(schema, isSchema =TRUE, useInternal = TRUE)
  doc = xmlParse(document)
  validation = xmlSchemaValidate(xsd, doc)
  if (validation$status == 0) {
    return(TRUE)
  } else {
    return(validation[[2]])
  }
}
