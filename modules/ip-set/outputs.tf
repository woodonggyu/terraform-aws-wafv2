output "aws_wafv2_ip_set_arn" {
  description = "The ARN of the IPSet."
  value       = aws_wafv2_ip_set.this[*].arn
}