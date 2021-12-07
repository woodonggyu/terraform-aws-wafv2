terraform {
  required_version = ">= 1.0.8"
  experiments      = [module_variable_optional_attrs]

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60.0"
    }
  }
}