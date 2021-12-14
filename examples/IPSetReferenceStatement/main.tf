provider "aws" { region = "ap-northeast-2" }

module "wafv2" {
  source  = "woodonggyu/wafv2/aws"
  version = "2.0.0"

  enable_webacl_association = false
  alb_resource_arn          = []

  enable_logging_configuration = false
  log_destination_configs      = []

  name  = "WebACL01"
  scope = "REGIONAL"

  rules = [
    {
      name     = "IPSetReferenceRule01"
      priority = 10
      action   = "count"
      ip_set_reference_statement = {
        arn = ""
      }
      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "cloudwatch_wafv2_metrics"
        sampled_requests_enabled   = false
      }
    },
    {
      name     = "IPSetReferenceRule02"
      priority = 20
      action   = "count"
      ip_set_reference_statement = {
        arn = ""
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