variable "region" {
  type        = string
  description = "The Region of the AWS."
  default     = "ap-northeast-2"
}

variable "name" {
  type        = string
  description = "A friendly name of the WebACL."
}

variable "description" {
  type        = string
  description = "A friendly description of the WebACL."
  default     = null
}

variable "scope" {
  type        = string
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application."
}

variable "default_action" {
  type        = string
  description = "The action to perform when a web request doesn't match any of the rules in the WebACL."
  default     = "allow"
}

variable "visibility_config" {
  type = object({
    # A boolean indicating whether the associated resource sends metrics to CloudWatch.
    cloudwatch_metrics_enabled = bool
    # A friendly name of the CloudWatch metric
    metric_name = string
    # A boolean indicating whether AWS WAF should store a sampling of the web requests that match the rules.
    sampled_requests_enabled = bool
  })
  description = "Defines and enables Amazon CloudWatch metrics and web request sample collection."
  default = {
    cloudwatch_metrics_enabled = false
    metric_name                = "cloudwatch-wafv2-metrics"
    sampled_requests_enabled   = false
  }
}

variable "rules" {
  type = list(object({
    name            = string
    priority        = number
    action          = optional(string)
    override_action = optional(string)
    managed_rule_group_statement = optional(object({
      name          = string
      vendor_name   = string
      excluded_rule = list(string)
      scope_down_statement = optional(object({
        and_statement = optional(any)
        or_statement  = optional(any)
        not_statement = optional(any)
        geo_match_statement = optional(object({
          country_codes = list(string)
        }))
        ip_set_reference_statement = optional(object({
          arn = string
        }))
        label_match_statement = optional(object({
          key   = string
          scope = string
        }))
        byte_match_statement = optional(object({
          field_to_match = object({
            all_query_arguments = optional(map(any))
            body                = optional(map(any))
            json_body           = optional(object({
              invalid_fallback_behavior = optional(string)
              match_scope               = string
              match_pattern             = map(any)
            }))
            method              = optional(map(any))
            query_string        = optional(map(any))
            single_header = optional(object({
              name = string
            }))
            single_query_argument = optional(object({
              name = string
            }))
            uri_path = optional(map(any))
          })
          positional_constraint = string
          search_string         = string
          text_transformation = object({
            priority = number
            type     = string
          })
        }))
        size_constraint_statement = optional(object({
          field_to_match = object({
            all_query_arguments = optional(map(any))
            body                = optional(map(any))
            method              = optional(map(any))
            query_string        = optional(map(any))
            single_header = optional(object({
              name = string
            }))
            single_query_argument = optional(object({
              name = string
            }))
            uri_path = optional(map(any))
          })
          comparison_operator = string
          size                = number
          text_transformation = object({
            priority = number
            type     = string
          })
        }))
        sqli_match_statement = optional(object({
          field_to_match = object({
            all_query_arguments = optional(map(any))
            body                = optional(map(any))
            method              = optional(map(any))
            query_string        = optional(map(any))
            single_header = optional(object({
              name = string
            }))
            single_query_argument = optional(object({
              name = string
            }))
            uri_path = optional(map(any))
          })
          text_transformation = object({
            priority = number
            type     = string
          })
        }))
        xss_match_statement = optional(object({
          field_to_match = object({
            all_query_arguments = optional(map(any))
            body                = optional(map(any))
            method              = optional(map(any))
            query_string        = optional(map(any))
            single_header = optional(object({
              name = string
            }))
            single_query_argument = optional(object({
              name = string
            }))
            uri_path = optional(map(any))
          })
          text_transformation = object({
            priority = number
            type     = string
          })
        }))
      }))
    }))
    ip_set_reference_statement    = optional(object({
      arn = string
    }))
    geo_match_statement           = optional(object({
      country_codes = list(string)
    }))
    rate_based_statement          = optional(object({
      limit                 = number
      aggregate_key_type    = string
      forwarded_ip_config   = optional(object({
        fallback_behavior = string
        header_name       = string
      }))
    }))
    size_constraint_statement     = optional(object({
      field_to_match = object({
        all_query_arguments = optional(map(any))
        body                = optional(map(any))
        method              = optional(map(any))
        query_string        = optional(map(any))
        single_header = optional(object({
          name = string
        }))
        single_query_argument = optional(object({
          name = string
        }))
        uri_path = optional(map(any))
      })
      comparison_operator = string
      size                = number
      text_transformation = object({
        priority = number
        type     = string
      })
    }))
    sqli_match_statement        = optional(object({
      field_to_match = object({
        all_query_arguments = optional(map(any))
        body                = optional(map(any))
        method              = optional(map(any))
        query_string        = optional(map(any))
        single_header = optional(object({
          name = string
        }))
        single_query_argument = optional(object({
          name = string
        }))
        uri_path = optional(map(any))
      })
      text_transformation = object({
        priority = number
        type     = string
      })
    }))
    xss_match_statement        = optional(object({
      field_to_match = object({
        all_query_arguments = optional(map(any))
        body                = optional(map(any))
        method              = optional(map(any))
        query_string        = optional(map(any))
        single_header = optional(object({
          name = string
        }))
        single_query_argument = optional(object({
          name = string
        }))
        uri_path = optional(map(any))
      })
      text_transformation = object({
        priority = number
        type     = string
      })
    }))
    and_statement = optional(any)
    or_statement  = optional(any)
    not_statement = optional(any)
    visibility_config = object({
      cloudwatch_metrics_enabled = bool
      metric_name                = string
      sampled_requests_enabled   = bool
    })
  }))
  description = "The processing guidance for a Rule, used by AWS WAF to determine whether a web request matches the rule."
  default = [
    {
      name                  = "WebACL01"
      priority              = 10
      action                = "count"
      and_statement         = {
        statements = [
          {
            geo_match_statement = {
              country_codes = ["AF"]
            }
          },
          {
            ip_set_reference_statement = {
              arn = "arn:aws:wafv2:ap-northeast-2:362252864672:regional/ipset/malware/a3138dc0-d7f8-448e-b6d7-8aa39a75a20e"
            }
          }
        ]
      }
      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "cloudwatch-webacl-metrics"
        sampled_requests_enabled   = false
      }
    }
  ]
}

variable "tags" {
  type        = map(string)
  description = "A tag associated with an AWS resource."
  default     = null
}