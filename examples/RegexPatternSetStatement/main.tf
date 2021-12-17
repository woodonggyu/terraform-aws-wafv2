provider "aws" { region = "ap-northeast-2" }

module "regex-pattern-set" {
  source = "../../modules/regex-pattern-set"

  name          = ["regex01", "regex02"]
  scope         = "REGIONAL"
  regex_strings = [["^HTTP", "^HTTPS"], ["^TEST", "^TESTS"]]
}

module "wafv2" {
  source  = "../.."

  enable_logging_configuration = false
  log_destination_configs      = []

  enable_webacl_association = false
  alb_resource_arn          = []

  name  = "WebACL01"
  scope = "REGIONAL"

  rules = [
    {
      name     = "AndRule01"
      priority = 10
      action   = "count"
      and_statement = {
        statements = [
          {
            regex_pattern_set_reference_statement = {
              field_to_match = {
                single_header = {
                  name = "host"
                }
              }
              arn = module.regex-pattern-set.aws_wafv2_regex_pattern_set_arn[0]
              text_transformation = {
                priority = 10
                type     = "NONE"
              }
            }
          },
          {
            regex_pattern_set_reference_statement = {
              field_to_match = {
                single_header = {
                  name = "test"
                }
              }
              arn = module.regex-pattern-set.aws_wafv2_regex_pattern_set_arn[1]
              text_transformation = {
                priority = 10
                type     = "NONE"
              }
            }
          }
        ]
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