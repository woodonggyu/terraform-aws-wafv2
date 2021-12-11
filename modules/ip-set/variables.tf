variable "region" {
  type        = string
  description = "The Region of the AWS."
  default     = "ap-northeast-2"
}

variable "ip_set" {
  type        = number
  description = "Count of IP set to create."
  default     = null
}

variable "name" {
  type        = list(string)
  description = "The descriptive name of the IP set."
  default     = null
}

variable "scope" {
  type        = string
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application."
  default     = null
}

variable "ip_address_version" {
  type        = string
  description = "Specify IPV4 or IPV6."
  default     = "IPV4"
}

variable "addresses" {
  type        = list(string)
  description = "The Filename to import IP sets. Specify one or more IP addresses  contains by CIDR notation."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Key:value pairs associated with an AWS resource."
  default     = null
}