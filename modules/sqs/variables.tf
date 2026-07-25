variable "s3_lambda_deadletter_queue_name" {
  type        = string
  description = "Name of dead letter queue for s3 lambda function"
}

variable "delay_seconds" {
  type        = number
  description = "Number of delayed seconds"
}

variable "max_message_size" {
  type        = number
  description = "The maximum number of messages to have in a queue"
}

variable "message_retention_seconds" {
  type        = number
  description = "The number of seconds to retain a message in queue"
}

variable "receive_wait_time_seconds" {
  type        = number
  description = "Number of seconds to wait before application can consume messages from queue"
}

variable "visibility_timeout_seconds" {
  type = number
  description = "The number of seconds for visibility timeout"
}