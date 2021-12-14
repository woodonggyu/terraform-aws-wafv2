provider "aws" { region = "ap-northeast-2" }

module "wafv2" {
  source  = "woodonggyu/wafv2/aws"
  version = "2.2.0"

  enable_logging_configuration = false
  log_destination_configs      = []

  enable_webacl_association = false
  alb_resource_arn          = []

  name  = "WebACL01"
  scope = "REGIONAL"

  rules = [
    {
      name     = "ByteMatchRule01"
      priority = 10
      action   = "count"
      byte_match_statement = {
        field_to_match = {
          single_header = {
            name = "host"
          }
        }
        positional_constraint = "EXACTLY"
        search_string         = "test"
        text_transformation = {
          priority = 20
          type     = "NONE"
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
    "Name" : "PROD.WAFv2"
    "Team" : "Security Engineering"
    "Owner" : "Donggyu Woo"
  }
}