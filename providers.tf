# configure aws provider to establish a secure connection between terraform and aws
provider "aws" {
  region  = var.region
  profile = "terraform-user"

  default_tags {
    tags = {
      "Automation"  = "terraform"
      "Project"     = var.project_name
      "Environment" = var.environment
    }
  }
}


terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.5"
    }
    http = {
      source = "hashicorp/http"
      #version = "2.1.0"
      version = "~> 2.1"
    }
  }
}

provider "kubernetes" {
  # Configuration options
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:ap-south-1:301167228985:cluster/stademo"
}

eks_cluster_name = data.terraform_remote_state.eks.outputs.cluster_id


/* terraform {
  required_version = ">= 1.0.0"
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.5"
    }
    http = {
      source = "hashicorp/http"
      #version = "2.1.0"
      version = "~> 2.1"
    }
  }
  backend "s3" {
    bucket = "mt-terraform-aws-eks"
    key    = "dev/aws-lbc/terraform.tfstate"
    region = "ap-south-1"

    # For State Locking
    dynamodb_table = "dev-aws-lbc"
  }
} 
provider "http" {
  # Configuration options
} */