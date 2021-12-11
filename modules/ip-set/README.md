# AWS WAFv2 IP-sets (Terraform sub-modules)

Terraform sub-module which creates WAFv2 IP-sets resource on AWS.

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
| [aws_wafv2_ip_set.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_ip_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The Region of the AWS. | `string` | `ap-northeast-2` | no |
| name | The descriptive name of the IP set. | `list(string)` | `null` | yes |
| scope | Specifies whether this is for an AWS CloudFront distribution or for a regional application. | `string` | `null` | yes |
| ip_set | Count of IP set to create. | `number` | `null` | yes
| ip_address_version | Specify IPV4 or IPV6. | `string` | `IPV4` | no |
| addresses | The Filename to import IP sets. Specify one or more IP addresses  contains by CIDR notation. | `list(string)` | `null` | yes |
| tags | Key:value pairs associated with an AWS resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws_wafv2_ip_set_arn | The ARN of the IPSet. |

## Dependencies

This module does not have any dependencies to other modules.

## Authors

Module is maintained by Donggyu Woo

## License

MIT Licensed. See [LICENSE](https://github.com/woodonggyu/terraform-aws-wafv2/blob/main/LICENSE) for full details.
