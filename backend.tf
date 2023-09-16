terraform {
  backend "gcs" {
    bucket = "guru-playground-global-assets-registry"
    prefix = "terraform/state"
  }
}
