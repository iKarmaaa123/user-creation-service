resource "aws_dynamodb_table" "my_aws_dynamodb_table" {
  name                        = var.dynamodb_table_name
  hash_key                    = var.hash_key
  billing_mode                = var.billing_mode
  stream_enabled              = var.stream_enabled
  stream_view_type            = var.stream_view_type
  deletion_protection_enabled = var.deletion_protection_enabled

  attribute {
    name = var.attribute_name
    type = var.attribute_key_type
  }
}
