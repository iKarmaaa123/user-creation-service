variable "dynamodb_table_name" {
  type        = string
  description = "Name of dynamodb table"
}

variable "hash_key" {
  type        = string
  description = "Name of hash or partition key"
}

variable "billing_mode" {
  type        = string
  description = "Billing mode for dynamodb table"
}

variable "stream_enabled" {
  type        = bool
  description = "Whether or not to enable dynamodb event streams"
}

variable "attribute_name" {
  type        = string
  description = "Name of attribute"
}

variable "attribute_key_type" {
  type        = string
  description = "The data type of attribute key"
}

variable "stream_view_type" {
  type        = string
  description = "Determines what is written to table stream when item has been modified"
}

variable "deletion_protection_enabled" {
  type        = bool
  description = "Whether to enable delete protection on DynamoDB table"
}