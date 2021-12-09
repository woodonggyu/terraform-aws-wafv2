provider "aws" { region = "ap-northeast-2" }

module "wafv2" {
  source  = "../.."
  name    = "WebACL01"
  scope   = "REGIONAL"

  rules = [
    {
      name                          = "ManagedRuleGroup01"
      priority                      = 20
      override_action               = "count"
      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "cloudwatch_wafv2_metrics"
        sampled_requests_enabled   = false
      }
      managed_rule_group_statement  = {
        name                  = "AWSManagedRulesCommonRuleSet"
        vendor_name           = "AWS"
        excluded_rule         = ["NoUserAgent_HEADER"]
        scope_down_statement  = {
          and_statement = {
            statements = [
              {
                ip_set_reference_statement = {
                  arn = "arn:aws:wafv2:ap-northeast-2:362252864672:regional/ipset/malware/a3138dc0-d7f8-448e-b6d7-8aa39a75a20e"
                }
              },
              {
                sqli_match_statement = {
                  field_to_match = {
                    body = {}
                  }
                  text_transformation = {
                    priority  = 11
                    type      = "NONE"
                  }
                }
              }
            ]
          }
        }
      }
    },
    {
      name      = "WebACL01"
      priority  = 10
      action    = "block"
      geo_match_statement = {
        country_codes = ["BD"]
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