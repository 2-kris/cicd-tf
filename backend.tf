terraform {
  backend "s3" {
    bucket       = "amzn-terraform-backend-02-062026"
    key          = "dev/terraform.tfstate"
    region       = "us-west-2"
    encrypt      = true
    use_lockfile = true
  }
}