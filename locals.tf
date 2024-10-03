# variable "env" {
#   validation {
#     condition     = length(var.env) > 3
#     error_message = <<EOF
#     The valie is invalid.
#     Value must be less than 2 characters.
#     dev = "dv"
#     qa = "qa"
#     vang = "vg"
#     helix = "hl"
#   EOF
#   }
# }

/* variable "business_unit" {
} */

/* locals {
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

} */


/* locals {
  env           = lower(var.env)
  business_unit = lower(var.business_unit)

  us_nonprod_folder = contains(["vang", "helix", "nprd-pr"], local.env) ? local.env == "nprd-pr" ? lookup(local.us_nonprod, local.business_unit) : lookup(local.us_nonprod, local.env) : null
  us_prod_folder    = local.env == "prod-pr" ? lookup(local.us_prod, local.business_unit) : null
  us_dr_folder      = local.env == "prod-dr" ? lookup(local.us_dr, local.business_unit) : null
} */


/* output "folder_id" {
  value = coalesce(local.us_nonprod_folder, local.us_prod_folder, local.us_dr_folder)
} */

/* locals {
  postfix_map = {
    dev   = "dv"
    qa    = "qa"
    vang  = "vg"
    helix = "hl"
  }
} */


/* locals {
  iam_memberships = flatten([
    for membership in var.user_permissions : [
      for member in membership.members : {
        role       = membership.role
        member     = member
      }
    ]
  ])
  list = { for m in local.iam_memberships : "${m.role}-${m.member}" => m }
} */