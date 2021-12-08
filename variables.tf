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
  type        = any
  description = "The processing guidance for a Rule, used by AWS WAF to determine whether a web request matches the rule."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A tag associated with an AWS resource."
  default     = null
}