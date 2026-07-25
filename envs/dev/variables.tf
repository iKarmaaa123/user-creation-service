variable "env" {
  type        = string
  description = "Environment to deploy to"
}

variable "api_gateway_name" {
  type        = string
  description = "Name of api gateway"
}

variable "path_part" {
  type        = string
  description = "path that api supports"
}

variable "http_method" {
  type        = string
  description = "http method that rest api supports"
}

variable "authorization" {
  type        = string
  description = "Authorization for sending request to REST api"
}

variable "integration_input_type" {
  type        = string
  description = "Integration input's type"
}

variable "stage_name" {
  type        = string
  description = "Name of stage"
}

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

variable "lambda_execution_role_name" {
  type        = string
  description = "Lambda execution role name"
}

variable "logging_policy_name" {
  type        = string
  description = "Policy name for logging iam policy"
}

variable "dynamodb_policy_name" {
  type        = string
  description = "Policy name for dynamodb iam policy"
}

variable "dynamodb_streams_policy_name" {
  type        = string
  description = "Name for DynamoDB streams IAM policy"
}

variable "s3_policy_name" {
  type        = string
  description = "Policy name for S3 iam policy"
}

variable "eventbridge_policy_name" {
  type        = string
  description = "Policy name for eventbridge IAM policy for lambda execution role"
}

variable "sqs_policy_name" {
  type        = string
  description = "Policy name for sqs IAM policy"
}

variable "lambda_dynamodb_role_name" {
  type        = string
  description = "Name for lambda dynamodb function role name"
}

variable "lambda_s3_role_name" {
  type        = string
  description = "Name for lambda s3 function role name"
}

variable "dynamodb_lambda_function_name" {
  type        = string
  description = "Name of dynamodb lambda function"
}

variable "s3_lambda_function_name" {
  type        = string
  description = "Name of s3 lambda function"
}

variable "method_type" {
  type        = string
  description = "Method of archiving file"
}

variable "dynamodb_function_handler" {
  type        = string
  description = "DynamoDB lambda function's entry point"
}

variable "s3_function_handler" {
  type        = string
  description = "S3 lambda function's entry point"
}

variable "runtime" {
  type        = string
  description = "Runtime the lambda is going to use when executing code"
}

variable "timeout" {
  type        = number
  description = "Value for when lambda function should stop running"
}

variable "apigateway_statement_id" {
  type        = string
  description = "Statement identifiers"
}

variable "eventbridge_statement_id" {
  type        = string
  description = "Statement identifiers"
}

variable "invoke_action" {
  type        = string
  description = "What action the resource can perform over the lambda function"
}

variable "apigateway_principle" {
  type        = string
  description = "AWS service that is going to invoke lambda function"
}

variable "eventbridge_principle" {
  type        = string
  description = "AWS service that is going to invoke lambda function"
}

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

variable "max_receive_count" {
  type        = number
  description = "Number of messages to replay back to source queue"
}

variable "visibility_timeout_seconds" {
  type = number
  description = "The number of seconds for visibility timeout"
}

variable "event_bus_name" {
  type        = string
  description = "Name of event bus"
}

variable "event_bus_description" {
  type        = string
  description = "Description for event bus"
}

variable "event_bus_rule_name" {
  type        = string
  description = "Name for event bus rule name"
}

variable "event_bus_rule_description" {
  type        = string
  description = "Description of rule event"
}

variable "eventbridge_source" {
  type        = string
  description = "source of where the event came from"
}

variable "eventbridge_detail_type" {
  type        = string
  description = "Detail type for event bus rule and eventbridge pipe target"
}

variable "eventbridge_pipe_name" {
  type        = string
  description = "Name of eventbridge pipe"
}

variable "eventbridge_pipe_log_level" {
  type        = string
  description = "Log level for eventbridge pipe"
}

variable "eventbridge_pipe_starting_position" {
  type        = string
  description = "Starting position for dynamodb stream event consumption"
}

variable "eventbridge_pipe_batch_size" {
  type        = number
  description = "Number of records to process per batch from dynamodb streams"
}

variable "eventbridge_pipe_maximum_batching_window_in_seconds" {
  type        = number
  description = "Maximum time to buffer records before processing a batch"
}

variable "eventbridge_pipe_maximum_retry_attempts" {
  type        = number
  description = "Maximum number of retry attempts for failed records"
}

variable "eventbridge_pipe_filter_event_names" {
  type        = list(string)
  description = "Dynamodb stream event names to include in eventbridge pipe"
}

variable "bucket_name" {
  type        = string
  description = "Name of S3 bucket"
}

variable "eventbridge_pipes_log_group_name" {
  type        = string
  description = "Name of cloudwatch log group for eventbridge pipes"
}

variable "lambda_alarm_comparison_operator" {
  type        = string
  description = "Comparison operator for lambda alarms"
}

variable "lambda_alarm_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods for lambda alarms"
}

variable "lambda_alarm_namespace" {
  type        = string
  description = "Cloudwatch namespace for lambda alarm metrics"
}

variable "lambda_alarm_period" {
  type        = number
  description = "Period in seconds for lambda alarm metrics"
}

variable "lambda_error_metric_name" {
  type        = string
  description = "Metric name used for lambda error alarms"
}

variable "lambda_error_alarm_statistic" {
  type        = string
  description = "Statistic used for lambda error alarms"
}

variable "lambda_error_alarm_threshold" {
  type        = number
  description = "Threshold used for lambda error alarms"
}

variable "lambda_error_alarm_description" {
  type        = string
  description = "Description used for lambda error alarms"
}

variable "lambda_throttle_metric_name" {
  type        = string
  description = "Metric name used for lambda throttle alarms"
}

variable "lambda_throttle_alarm_statistic" {
  type        = string
  description = "Statistic used for lambda throttle alarms"
}

variable "lambda_throttle_alarm_threshold" {
  type        = number
  description = "Threshold used for lambda throttle alarms"
}

variable "lambda_throttle_alarm_description" {
  type        = string
  description = "Description used for lambda throttle alarms"
}

variable "lambda_alarm_topic_name" {
  type        = string
  description = "Base name for lambda alarm sns topic"
}

variable "protocol" {
  type        = string
  description = "Protocol for SNS topic subscription"
}

variable "endpoint" {
  type        = string
  description = "Endpoint to send sns message to"
}