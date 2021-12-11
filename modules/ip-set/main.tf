provider "aws" { region = var.region }

resource "aws_wafv2_ip_set" "this" {
  count              = var.count_ip_set

  name               = var.name[count.index]
  scope              = var.scope
  ip_address_version = var.ip_address_version
  addresses          = split("\n", file(var.addresses[count.index]))

  tags = var.tags
}