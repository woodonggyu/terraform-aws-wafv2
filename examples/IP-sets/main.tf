provider "aws" { region = "ap-northeast-2" }

locals {
  tags = {
    "Name" : "PROD.WAFv2"
    "Team" : "Security Engineering"
    "Owner" : "Donggyu Woo"
  }
}

module "ip-set" {
  source  = "woodonggyu/wafv2/aws//modules/ip-set"
  version = "2.3.0"

  ip_set             = 2
  name               = ["IPSetRule01", "IPSetRule02"]
  scope              = "REGIONAL"
  addresses          = ["blacklist.txt", "whitelist.txt"]
  ip_address_version = "IPV4"

  tags = local.tags
}

module "wafv2" {
  source  = "woodonggyu/wafv2/aws"
  version = "2.3.0"

  enable_webacl_association = false
  alb_resource_arn          = []

  enable_logging_configuration = false
  log_destination_configs      = []

  name  = "WebACL01"
  scope = "REGIONAL"

  rules = [
    {
      name     = "BlacklistRule"
      priority = 20
      action   = "count"
      ip_set_reference_statement = {
        arn = module.ip-set.aws_wafv2_ip_set_arn[0]
      }
      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "cloudwatch_wafv2_metrics"
        sampled_requests_enabled   = false
      }
    },
    {
      name     = "WhitelistRule"
      priority = 30
      action   = "count"
      ip_set_reference_statement = {
        arn = module.ip-set.aws_wafv2_ip_set_arn[1]
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

  tags = local.tags
}