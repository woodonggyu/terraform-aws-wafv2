provider "aws" { region = "ap-northeast-2" }

module "wafv2" {
  source  = "woodonggyu/wafv2/aws"
  version = "2.0.0"

  name    = "WebACL01"
  scope   = "REGIONAL"

  rules = [
    {
      name     = "XssMatchRule01"
      priority = 10
      action   = "count"
      xss_match_statement = {
        field_to_match = {
          method    = {}
        }
        text_transformation = {
          priority  = 10
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

  enable_logging_configuration  = false
  log_destination_configs       = []

  enable_webacl_association = false
  alb_resource_arn          = []
}