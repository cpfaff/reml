# Defines the xml path schemes of eml parts
dataset = list (
  # DatasetType list

  # Resource Group
  alternateIdentifier = "//dataset/alternateIdentifier",  # (dashed)
  shortName = "//dataset/shortName", # (dashed)
  title = "//dataset/title",
  creator = "//dataset/creator", # (module responsible party)
  metadataProvider = "//dataset/metadataProvider", # (module responsible party)
  associatedParty = "//dataset/associatedParty", # (module responsible party)
  role = "//dataset/associatedParty/role", # (responsible party but pulled out already)
  pubDate = "//dataset/pubDate", # (dashed)
  language = "//dataset/language", # (dashed)
  series = "//dataset/series", # (dashed)
  abstract = "//dataset/abstract", # (dashed, module TextType)

  keywordSet = "//dataset/keywordSet", # (dashed, node contains 1..n keywords or keyword thesaurusname)
    keyword = "//dataset/keywordSet/keyword",
    keywordThesaurus = "//dataset/keywordSet/keywordThesaurus",
  additionalInfo = "//dataset/additionalInfo", # (dashed, module TextType)
  intellectualRights = "//dataset/intellectualRights", # (dashed, module TextType)
  distribution = "//dataset/distribution", # (dashed, module DistributionType)
  coverage = "//dataset/coverage", # (dashed, module Coverage)

  purpose = "//dataset/purpose", # (dashed, module TextType)

  # Maintenance Type
  maintenance = "//dataset/maintenance", # (dashed, node contains description, update frequency, histor)
    description = "//dataset//maintenance/description", # (dashed, module TextType)
    maintenanceUpdateFrequency = "//dataset/maintenance/maintenanceupdatefrequency", # (dashed)
    changeHistory = "//dataset/maintenance/changeHistory", # (dashed, node contains scope oldValue, change date, and comment)
      changeScope = "//dataset/maintenance/changeHistory/changeScope",
      oldValue = "//dataset/maintenance/changeHistory/changeDate",
      changeDate = "//dataset/maintenance/changeHistory/changeDate",
      comment = "//dataset/maintenance/changeHistory/comment", # (dashed)

    contact = "//dataest/contact", # (module ResponsibleParty)
    publisher = "//dataset/publisher", # (dashed, module ResponsibleParty)
    pubPlace = "//dataset/pubPlace", # (dashed)
    methods = "//dataset/methods", # (dashed, module MethodType)
    project = "//dataest/project", # (dashed, module ResearchProjectType)

    # 0..n
    dataTable = "//dataset/dataTable", # (module DataTableType)
    spatialRaster = "//dataset/spatialRaster", # (module SpatialRasterType)
    spatialVector = "//dataset/spatialVector", # (module SpatialVectorType)
    storedProcedure = "//dataset/storedProcedure", #(module StoreProcedureType)
    view = "//dataset/view", # (module ViewType)
    otherEntity = "//dataset/otherEntity", # (module ViewType)

    # Reverence Group
    references = "//dataset/references"
)

citation = list(
  # CitationType list

  # Resource Group
  alternateIdentifier = "//citation//alternateIdentifier", # (0..n)

  shortName = "//citation/shortName", # (dashed)
  title = "//citation/title", # (1..n)
  creator = "//citation/creator", # (1..n, module ResponsibleParty)
  metadataProvider = "//citation/metadataProvider", # (dashed, 0..n, module ResponsibleParty)
  associatedParty = "//citation/associatedParty", # (dashed, 0..n, module ResponsibleParty)
    role = "//citation/associatedParty/role",
  pubDate = "//citation/pubDate", # (dashed)
  language = "//citation/language", # (dashed)
  series = "//citation/series", # (dashed)
  abstract = "//citation/abstract", # (dashed, module TextType)
  keywordSet = "//citation/keywordSet", # (dashed, 0..n, conrains: keyword 1.n and kekywordThesaurus)
    keyword = "//citation/keywordSet/keyword", # (1..n)
    keywordThesaurus = "//citation/keywordSet/keywordThesaurus", # (dashed)
  additionalInfo = "//citation/additionalInfo", # (dashed, 0..n, module TextType)
  intellecutalRights = "//citation/"

  # unfinished yet
)








  # template = list(

    # title = "//dataset/title",

    # creators = list(
      # salutation = "//creator/individualName/salutation",
      # givenName = "//creator/individualName/givenName",
      # surName = "//creator/individualName/surName",
      # electronicMailAddress = "//creator/electronicMailAddress",
      # organizationName = "//creator/organizationName",
      # deliveryPoint = "//creator/address/deliveryPoint",
      # city = "//creator/address/city",
      # administrativeArea = "//creator/address/administrativeArea",
      # postalCode = "//creator/address/postalCode",
      # country = "//creator/address/postalCode",
      # phone = "//creator/phone[@phonetype='voice']",
      # fax = "//creator/phone[@phonetype='fax']",
      # electronicMailAddress = "//creator/electronicMailAddress",
      # onlineUrl = "//creator/onlineUrl"),

      # associatedParty = list(
        # references = "//dataset/associatedParty/references",
        # role = "//dataset/associatedParty/role"),

      # abstract = "//dataset/abstract",

      # keywords = "//keywordSet/keyword",

      # contacts = list(
        # salutation = "//contact/individualName/salutation",
        # givenName = "//contact/individualName/givenName",
        # surName = "//contact/individualName/surName",
        # electronicMailAddress = "//contact/electronicMailAddress",
        # organizationName = "//contact/organizationName",
        # deliveryPoint = "//contact/address/deliveryPoint",
        # city = "//contact/address/city",
        # administrativeArea = "//contact/address/administrativeArea",
        # postalCode = "//contact/address/postalCode",
        # country = "//contact/address/postalCode",
        # phone = "//contact/phone[@phonetype='voice']",
        # fax = "//contact/phone[@phonetype='fax']",
        # electronicMailAddress = "//contact/electronicMailAddress",
        # onlineUrl = "//contact/onlineUrl"),

      # samplingDescription = "//dataset//samplingDescription",

      # intellectualRights = "//dataset/intellectualRights",

      # # coverage

      # geographicCoverage = list(
        # geographicDescription = "//geographicCoverage/geographicDescription",
        # boundingCoordinates = c(westBoundingCoordinate = "//geographicCoverage/boundingCoordinates/westBoundingCoordinate",
          # eastBoundingCoordinate = "//geographicCoverage/boundingCoordinates/eastBoundingCoordinate",
          # northBoundingCoordinate = "//geographicCoverage/boundingCoordinates/northBoundingCoordinate",
          # southBoundingCoordinate = "//geographicCoverage/boundingCoordinates/southBoundingCoordinate")),

      # temporalCoverage = list(
        # beginDate = "//temporalCoverage//beginDate",
        # endDate = "//temporalCoverage//endDate"
      # ),

      # taxonomicSystem = list(
        # title = "//coverage//taxonomicCoverage//title",
        # creator = "//coverage//taxonomicCoverage//creator",
        # publicationDate = "//coverage//taxonomicCoverage//pubDate",
        # journal = "//coverage//taxonomicCoverage//journal",
        # volume = "//coverage//taxonomicCoverage//volume",
        # issue = "//coverage//taxonomicCoverage//issue",
        # pageRange = "//coverage//taxonomicCoverage//pageRange",
        # publisher = "//coverage//taxonomicCoverage//publisher",
        # identifierName = "//coverage//taxonomicCoverage//identifierName",
        # taxonomicProcedures = "//coverage//taxonomicCoverage//taxonomicProcedures"
      # ),

      # taxonomicClassification = "//taxonomicClassification"
    # )

