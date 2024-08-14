variable "env" {
}

variable "business_unit" {
}

locals {
  us_nonprod = {
    advisory = "nonprod123"
    bpg      = "nonprod456"
    helix    = "nonprod789"
    vang     = "nonprod000"
  }
  us_prod = {
    advisory = "prod123"
    bpg      = "prod456"
    # helix = "prod789"
    # vang = "prod000"
  }
  us_dr = {
    advisory = "dr123"
    bpg      = "dr456"
    # helix = "dr789"
    # vang = "dr000"
  }

}


locals {
  env           = lower(var.env)
  business_unit = lower(var.business_unit)

  us_nonprod_folder = contains(["vang", "helix", "nprd-pr"], local.env) ? local.env == "nprd-pr" ? lookup(local.us_nonprod, local.business_unit) : lookup(local.us_nonprod, local.env) : null
  us_prod_folder    = local.env == "prod-pr" ? lookup(local.us_prod, local.business_unit) : null
  us_dr_folder      = local.env == "prod-dr" ? lookup(local.us_dr, local.business_unit) : null
}


output "folder_id" {
  value = coalesce(local.us_nonprod_folder, local.us_prod_folder, local.us_dr_folder)
}