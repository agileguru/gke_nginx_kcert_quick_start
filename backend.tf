terraform {
  backend "gcs" {
    bucket = "global-assets-registry"
    prefix = "terraform/state"
  }
}
