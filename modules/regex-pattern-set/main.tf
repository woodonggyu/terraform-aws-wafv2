provider "aws" { region = var.region }

resource "aws_wafv2_regex_pattern_set" "this" {
  count = length(var.name)

  name        = var.name[count.index]
  scope       = var.scope

  dynamic "regular_expression" {
    for_each = var.regex_strings == null ? [] : var.regex_strings[count.index]
    content {
      regex_string = regular_expression.value
    }
  }
}