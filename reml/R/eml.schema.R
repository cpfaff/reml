# Defines the xml path schemes of eml modules. The desctiptions are taken from
# the KNB homepage.

# The top level resources 

# Dataset 

# The eml-dataset module contains general information that describes dataset
# resources. It is intended to provide overview information about the dataset:
# broad information such as the title, abstract, keywords, contacts,
# maintenance history, purpose, and distribution of the data themselves. The
# eml-dataset module also imports many other modules that are used to describe
# the dataset in fine detail. Specifically, it uses the eml-methods module to
# describe methodology used in collecting or processing the dataset, the
# eml-project module to describe the overarching research context and
# experimental design, the eml-access module to define access control rules for
# the data and metadata, and the eml-entity module to provide detailed
# information about the logical structure of the dataset. A dataset can be (and
# often is) composed of a series of data entities (tables) that are linked
# together by particular integrity constraints.

# The eml-dataset module, like other modules, may be "referenced" via the
# <references> tag. This allows a dataset to be described once, and then used as
# a reference in other locations within the EML document via its ID. 

# Minimal scheme: 

# Elements: 	Use: 	How many:
# A choice of (
             # A sequence of (
                            # res:ResourceGroup	 	 
                            # purpose	optional	
                            # maintenance	optional	
                            # contact	required	unbounded
                            # publisher	optional	
                            # pubPlace	optional	
                            # methods	optional	
                            # project	optional	
                            # A choice of (
                                         # dataTable	required	
                                         # OR
                                         # spatialRaster	required	
                                         # OR
                                         # spatialVector	required	
                                         # OR
                                         # storedProcedure	required	
                                         # OR
                                         # view	required	
                                         # OR
                                         # otherEntity	required	
                                         # )
                            # )
             # OR
             # res:ReferencesGroup	 	 
             # )
# Attributes: 	Use: 	Default Value:
# id	optional
# system	optional
# scope	optional	document

dataset = list ( 
  alternateIdentifier = "//dataset/alternateIdentifier",  # (dashed)
  shortName = "//dataset/shortName", # (dashed)
  title = "//dataset/title",
  creator = "//dataset/creator", # (responsible party)
  metadataProvider = "//dataset/metadataProvider", # (responsible party)
  associatedParty = "//dataset/associatedParty", # (responsible party)
  role = "//dataset/associatedParty/role", # (responsible party but pulled out already)
  pubDate = "//dataset/pubDate", # (dashed)
  language = "//dataset/language", # (dashed)
  series = "//dataset/series", # (dashed)
  abstract = "//dataset/abstract", # (dashed, TextType)

  keywordSet = list(# "//dataset/keywordSet", # (dashed, 1..n keywords or keyword thesaurusname)
    keyword = "//dataset/keywordSet/keyword",
    keywordThesaurus = "//dataset/keywordSet/keywordThesaurus"),

  additionalInfo = "//dataset/additionalInfo", # (dashed, TextType)
  intellectualRights = "//dataset/intellectualRights", # (dashed, TextType)
  distribution = "//dataset/distribution", # (dashed, DistributionType)
  coverage = "//dataset/coverage", # (dashed, Coverage)

  purpose = "//dataset/purpose", # (dashed, TextType)

  # Maintenance Type
  maintenance = list(#"//dataset/maintenance" # (dashed, node contains description, update frequency, histor)
    description = "//dataset//maintenance/description", # (dashed, module TextType)
    maintenanceUpdateFrequency = "//dataset/maintenance/maintenanceupdatefrequency", # (dashed)
    changeHistory = list(#"//dataset/maintenance/changeHistory"), # (dashed, node contains scope oldValue, change date, and comment) 
      changeScope = "//dataset/maintenance/changeHistory/changeScope",
      oldValue = "//dataset/maintenance/changeHistory/oldValue",
      changeDate = "//dataset/maintenance/changeHistory/changeDate",
      comment = "//dataset/maintenance/changeHistory/comment")), # (dashed)

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

# citation = list(
  # # CitationType list

  # # Resource Group
  # alternateIdentifier = "//citation//alternateIdentifier", # (0..n)

  # shortName = "//citation/shortName", # (dashed)
  # title = "//citation/title", # (1..n)
  # creator = "//citation/creator", # (1..n, module ResponsibleParty)
  # metadataProvider = "//citation/metadataProvider", # (dashed, 0..n, module ResponsibleParty)
  # associatedParty = "//citation/associatedParty", # (dashed, 0..n, module ResponsibleParty)
    # role = "//citation/associatedParty/role",
  # pubDate = "//citation/pubDate", # (dashed)
  # language = "//citation/language", # (dashed)
  # series = "//citation/series", # (dashed)
  # abstract = "//citation/abstract", # (dashed, module TextType)
  # keywordSet = "//citation/keywordSet", # (dashed, 0..n, conrains: keyword 1.n and kekywordThesaurus)
    # keyword = "//citation/keywordSet/keyword", # (1..n)
    # keywordThesaurus = "//citation/keywordSet/keywordThesaurus", # (dashed)
  # additionalInfo = "//citation/additionalInfo", # (dashed, 0..n, module TextType)
  # intellecutalRights = "//citation/"

  # # unfinished yet
# )








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

