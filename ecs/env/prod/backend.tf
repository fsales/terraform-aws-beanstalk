terraform {
  backend "s3" {
    bucket = "terrafomr-state-ecs-park-tech"
    key    = "homolog/terraform.tfstate"
    region = "us-west-2"
  }
}
