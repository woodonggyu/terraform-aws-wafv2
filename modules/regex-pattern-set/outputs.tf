output "aws_wafv2_regex_pattern_set_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster."
  value       = aws_wafv2_regex_pattern_set.this[*].arn
}