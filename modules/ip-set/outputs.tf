output "aws_wafv2_ip_set_arn" {
  description = "The Amazon Resource Name (ARN) of the IP set."
  value       = aws_wafv2_ip_set.this[*].arn
}