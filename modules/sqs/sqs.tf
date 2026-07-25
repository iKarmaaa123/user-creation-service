resource "aws_sqs_queue" "s3_lambda_deadletter_queue" {
  name                       = var.s3_lambda_deadletter_queue_name
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
}