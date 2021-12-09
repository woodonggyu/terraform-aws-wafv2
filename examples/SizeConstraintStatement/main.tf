provider "aws" { region = "ap-northeast-2" }

module "wafv2" {
  source  = "../.."
  name    = "WebACL01"
  scope   = "REGIONAL"

  rules = [
    {
      name     = "SizeConstraintRule01"
      priority = 10
      action   = "count"
      size_constraint_statement = {
        field_to_match = {
          single_header = {
            name = "host"
          }
        }
        comparison_operator = "EQ"
        size                = 10
        text_transformation = {
          priority  = 20
          type      = "NONE"
        }
      }
      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "cloudwatch_wafv2_metrics"
        sampled_requests_enabled   = false
      }
    }
  ]

  visibility_config = {
    cloudwatch_metrics_enabled = false
    metric_name                = "cloudwatch_wafv2_metrics"
    sampled_requests_enabled   = false
  }

  tags = {
    "Name": "PROD.WAFv2"
    "Team": "Security Engineering"
    "Owner": "Donggyu Woo"
  }

  enable_webacl_association = false
  alb_resource_arn          = []
}