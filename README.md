# terraform-aws-wafv2

Terraform module which creates Web Application Firewall (WAFV2).

Available features

- ManagedRuleGroupStatement
- IPSetReferenceStatement
- GeoMatchStatement
- RateBasedStatement

## Examples

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

No Modules.

## Resources

| Name | Type |
|------|------|
| [aws_wafv2_web_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The Region of the AWS. | `string` | `ap-northeast-2` | no |
| name | A friendly name of the WebACL. | `string` | `""` | yes |
| description | A friendly description of the WebACL. | `string` | `null` | no |
| scope | Specifies whether this is for an AWS CloudFront distribution or for a regional application. | `string` | `""` | yes |
| default_action | The action to perform when a web request doesn't match any of the rules in the WebACL. | `string` | `allow` | no
| visibility_config | Defines and enables Amazon CloudWatch metrics and web request sample collection. | `object(...)` | <pre> { <br>   cloudwatch_metrics_enabled = false <br>   metric_name = "cloudwatch_wafv2_metrics" <br>   sampled_requests_enabled = false <br> } </pre> | no |  
| rule | The processing guidance for a Rule, used by AWS WAF to determine whether a web request matches the rule. | `list(object(...))` | `[]` | yes 
| tags | A tag associated with an AWS resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|


## Dependencies

This module does not have any dependencies to other modules.

## Authors

Module is maintained by Donggyu Woo

## License

MIT Licensed. See [LICENSE](https://github.com/woodonggyu/terraform-aws-wafv2/blob/main/LICENSE) for full details.
