variable "region" {
  type        = string
  description = "The Region of the AWS."
  default     = "ap-northeast-2"
}

variable "count_ip_set" {
  type        = number
  description = ""
}

variable "name" {
  type        = list(string)
  description = "A friendly name of the IP set."
}

variable "scope" {
  type        = string
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application."
}

variable "ip_address_version" {
  type        = string
  description = "Specify IPV4 or IPV6."
  default     = "IPV4"
}

variable "addresses" {
  type        = list(string)
  description = "Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A tag associated with an AWS resource."
  default     = null
}