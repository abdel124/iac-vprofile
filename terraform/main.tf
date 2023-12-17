provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
  shared_credentials_files = "~/.aws/credentials"
  profile = "default"
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.clusterName
}

##