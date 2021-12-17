variable "region" {
  type        = string
  description = "The Region of the AWS."
  default     = "ap-northeast-2"
}

variable "name" {
  type        = list(string)
  description = "A friendly name of the regular expression pattern set."
  default     = null
}

variable "scope" {
  type        = string
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application."
  default     = "REGIONAL"
}

variable "regex_strings" {
  type        = list(list(string))
  description = "One or more blocks of regular expression patterns."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Key:value pairs associated with an AWS resource."
  default     = null
}