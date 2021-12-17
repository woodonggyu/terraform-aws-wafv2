# AWS WAFv2 Regex-Pattern-Set (Terraform sub-modules)

Terraform sub-module which creates WAFv2 Regex-Pattern-Set resource on AWS.

## Examples

See [Example Codes](https://github.com/woodonggyu/terraform-aws-wafv2/tree/main/examples/IP-sets) for full details.

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_wafv2_regex_pattern_set.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_regex_pattern_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The Region of the AWS. | `string` | `ap-northeast-2` | no |
| name | A friendly name of the regular expression pattern set. | `list(string)` | `null` | yes |
| scope | Specifies whether this is for an AWS CloudFront distribution or for a regional application. | `string` | `null` | yes |
| regex_strings | One or more blocks of regular expression patterns. | `list(list(string))` | `null` | no
| tags | Key:value pairs associated with an AWS resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|

## Dependencies

This module does not have any dependencies to other modules.

## Authors

Module is maintained by Donggyu Woo

## License

MIT Licensed. See [LICENSE](https://github.com/woodonggyu/terraform-aws-wafv2/blob/main/LICENSE) for full details.
