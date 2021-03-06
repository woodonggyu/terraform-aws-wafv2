# terraform-aws-wafv2

Terraform module which creates Web Application Firewall (WAFV2).

Available features

- AWS Managed Rule Groups
- Statement
  - IPSetReferenceStatement
  - GeoMatchStatement
  - ByteMatchStatement
  - LabelMatchStatement
  - RateBasedStatement
  - SizeConstraintStatement
  - Logical Statement (And, Or, Not)
  - RegexPatternSetReferenceStatement
- Associating WAFv2 WebACL with AWS resources (API Gateway, ALB, AWS AppSync)
- Enabling Logging Configuration
- Create IP sets

## Examples

* See [Example Codes](https://github.com/woodonggyu/terraform-aws-wafv2/tree/main/examples) for full details.

## Requirements

| Name | Version |
|------|---------|
| terraform | \>= 1.0.8 |
| aws | \>= 3.60.0 |

## Providers

| Name | Version |
|------|---------|
| aws | \>= 3.60.0 |

## Modules
| Name | Type |
|------|------|

## Submodules
| Name | Type |
|------|------|
| [aws_wafv2_ip_set.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_ip_set) | resource |
| [aws_wafv2_regex_pattern_set.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_regex_pattern_set) | resource |

## Resources

| Name | Type |
|------|------|
| [aws_wafv2_web_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |
| [aws_wafv2_web_acl_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |
| [aws_wafv2_web_acl_logging_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The Region of the AWS. | `string` | `ap-northeast-2` | no |
| name | A friendly name of the WebACL. | `string` | `""` | yes |
| description | A friendly description of the WebACL. | `string` | `null` | no |
| scope | Specifies whether this is for an AWS CloudFront distribution or for a regional application. | `string` | `""` | yes |
| default_action | The action to perform when a web request doesn't match any of the rules in the WebACL. | `string` | `allow` | no
| visibility_config | Defines and enables Amazon CloudWatch metrics and web request sample collection. | `object({...})` | <pre> { <br>   cloudwatch_metrics_enabled = false <br>   metric_name = "cloudwatch_wafv2_metrics" <br>   sampled_requests_enabled = false <br> } </pre> | no |  
| rules | The processing guidance for a Rule, used by AWS WAF to determine whether a web request matches the rule. | `any` | `[]` | yes 
| tags | A tag associated with an AWS resource. | `map(string)` | `null` | no |
| enable_logging_configuration | Whether to enable logging configuration. | `bool` | `false` | no |
| log_destination_configs | The Amazon Kinesis Data Firehose Amazon Resource Name (ARNs) that you want to associate with the web ACL. | `list` | `[]` | no |
| redacted_fields | The parts of the request that you want to keep out of the logs. | `object({...})` | `null` | no
| logging_filter | Filtering that specifies which web requests are kept in the logs and which are dropped. | `object({...})` | `null` | no | 
| enable_webacl_association | Whether to associate ALB with WAFv2 WebACL. | `bool` | `false` | no |
| alb_resource_arn | The Amazon Resource Name (ARN) of the resource to associate with the web ACL. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|


## Dependencies

This module does not have any dependencies to other modules.

## Authors

Module is maintained by Donggyu Woo

## License

MIT Licensed. See [LICENSE](https://github.com/woodonggyu/terraform-aws-wafv2/blob/main/LICENSE) for full details.
