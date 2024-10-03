env           = "vang"
business_unit = "Advisory"

user_permissions = [
  {
    members = ["user:rupali.naik@abc.com", "user:pas@abc.com", "user:sas@abc.com", "user:mps@abc.com"]
    role    = "role/editor"
  },
  {
    members = ["user:naik@reader.com", "user:pas@reader.com", "user:sas@reader.com", "user:mps@reader.com"]
    role    = "role/reader"
  }
]