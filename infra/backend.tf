terraform {
  backend "gcs" {
    bucket = "levelup-state-bucket"
    prefix = "terraform/state"                                   
  }
}
