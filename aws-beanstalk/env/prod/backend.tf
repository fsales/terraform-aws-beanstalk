#########Terraform Backend S3
terraform {
  backend "s3" {
    bucket = "terrafomr-state-park-tech"
    key    = "prod/terraform.tfstate"
    region = "us-east-2"
  }
}

#############
