# A host project provides network resources to associated service projects.
/* resource "google_compute_shared_vpc_host_project" "host" {
  project = "host-project-id"
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = "service-project-id-1"
} */


module "project_shared_vpc_host" {
  source = "terraform-google-modules/project-factory/google"
  #version = "~> 15.0"

  name                           = "pshet-test"
  enable_shared_vpc_host_project = false
  random_project_id              = true
  #  org_id               = "1234567890"
  #   usage_bucket_name    = "pf-test-1-usage-report-bucket"
  #   usage_bucket_prefix  = "pf/test/1/integration"
  billing_account = "01F13C-AE01BB-053092"
  #   svpc_host_project_id = "shared_vpc_host_name"

  #   shared_vpc_subnets = [
  #     "projects/base-project-196723/regions/us-east1/subnetworks/default",
  #     "projects/base-project-196723/regions/us-central1/subnetworks/default",
  #     "projects/base-project-196723/regions/us-central1/subnetworks/subnet-1",
  #   ]

  activate_apis = [
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "oslogin.googleapis.com",
    "serviceusage.googleapis.com",
    "billingbudgets.googleapis.com",
    "pubsub.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "essentialcontacts.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
  ]

  deletion_policy = "DELETE"
}

/* resource "google_project_iam_member" "project" {
  for_each = local.list
  project = "totemic-fact-431817-c3"
  role    = each.value.role
  member  = each.value.member
} */