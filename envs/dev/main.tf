module "api-gateway" {
  source                 = "../../modules/api-gw"
  api_gateway_name       = var.api_gateway_name
  path_part              = var.path_part
  uri                    = module.lambda.lambda_function_dynamodb_invoke_arn
  http_method            = var.http_method
  authorization          = var.authorization
  integration_input_type = var.integration_input_type
  stage_name             = var.stage_name
}

module "iam" {
  source                                     = "../../modules/iam"
  lambda_dynamodb_role_name                  = var.lambda_dynamodb_role_name
  lambda_s3_role_name                        = var.lambda_s3_role_name
  dynamodb_policy_name                       = var.dynamodb_policy_name
  logging_policy_name                        = var.logging_policy_name
  s3_policy_name                             = var.s3_policy_name
  eventbridge_policy_name                    = var.eventbridge_policy_name
  dynamodb_table_arn                         = module.dynamodb.dynamodb_table_arn
  dynamodb_table_stream_arn                  = module.dynamodb.dynamodb_stream_arn
  s3_bucket_arn                              = module.s3.s3_bucket_arn
  eventbridge_pipes_cloudwatch_log_group_arn = module.cloudwatch.eventbridge_pipes_cloudwatch_log_group_arn
  dynamodb_streams_policy_name               = var.dynamodb_streams_policy_name
  sqs_policy_name                            = var.sqs_policy_name
  s3_lambda_deadletter_queue_arn             = module.sqs.s3_lambda_deadletter_queue_arn
  event_bus_arn                              = module.eventbridge.event_bus_arn
}

module "lambda" {
  source                        = "../../modules/lambda"
  lambda_dynamodb_function_role = module.iam.lambda_dynamodb_execution_iam_role
  lambda_s3_function_role       = module.iam.lambda_s3_execution_iam_role
  runtime                       = var.runtime
  dynamodb_function_handler     = var.dynamodb_function_handler
  s3_function_handler           = var.s3_function_handler
  method_type                   = var.method_type
  dynamodb_lambda_function_name = var.dynamodb_lambda_function_name
  s3_lambda_function_name       = var.s3_lambda_function_name
  apigateway_statement_id       = var.apigateway_statement_id
  eventbridge_statement_id      = var.eventbridge_statement_id
  invoke_action                 = var.invoke_action
  apigateway_principle          = var.apigateway_principle
  eventbridge_principle         = var.eventbridge_principle
  api_gateway_source_arn        = module.api-gateway.apigateway_execution_arn
  timeout                       = var.timeout
  s3_lambda_dead_letter_queue   = module.sqs.s3_lambda_deadletter_queue_arn
  event_bus_rule_source_arn     = module.eventbridge.event_bus_rule_arn
  dynamodb_table_name           = module.dynamodb.dynamodb_table_name
  bucket_name                   = module.s3.s3_bucket_name
}

module "dynamodb" {
  source                      = "../../modules/dynamodb"
  dynamodb_table_name         = var.dynamodb_table_name
  billing_mode                = var.billing_mode
  hash_key                    = var.hash_key
  stream_enabled              = var.stream_enabled
  attribute_key_type          = var.attribute_key_type
  attribute_name              = var.attribute_name
  stream_view_type            = var.stream_view_type
  deletion_protection_enabled = var.deletion_protection_enabled
}

module "sqs" {
  source                          = "../../modules/sqs"
  receive_wait_time_seconds       = var.receive_wait_time_seconds
  max_message_size                = var.max_message_size
  message_retention_seconds       = var.message_retention_seconds
  delay_seconds                   = var.delay_seconds
  s3_lambda_deadletter_queue_name = var.s3_lambda_deadletter_queue_name
}

module "eventbridge" {
  source                                              = "../../modules/eventbridge"
  event_bus_name                                      = var.event_bus_name
  event_bus_description                               = var.event_bus_description
  event_bus_rule_name                                 = var.event_bus_rule_name
  eventbridge_source                                  = var.eventbridge_source
  eventbridge_detail_type                             = var.eventbridge_detail_type
  event_bus_rule_description                          = var.event_bus_rule_description
  target_arn_resource                                 = module.lambda.lambda_function_s3_arn
  eventbridge_pipe_name                               = var.eventbridge_pipe_name
  eventbridge_pipe_role                               = module.iam.eventbridge_pipes_role_arn
  eventbridge_pipe_source                             = module.dynamodb.dynamodb_stream_arn
  eventbridge_pipe_target                             = module.eventbridge.event_bus_arn
  eventbridge_pipes_log_group                         = module.cloudwatch.eventbridge_pipes_cloudwatch_log_group_arn
  eventbridge_pipe_log_level                          = var.eventbridge_pipe_log_level
  eventbridge_pipe_starting_position                  = var.eventbridge_pipe_starting_position
  eventbridge_pipe_batch_size                         = var.eventbridge_pipe_batch_size
  eventbridge_pipe_maximum_batching_window_in_seconds = var.eventbridge_pipe_maximum_batching_window_in_seconds
  eventbridge_pipe_maximum_retry_attempts             = var.eventbridge_pipe_maximum_retry_attempts
  eventbridge_pipe_filter_event_names                 = var.eventbridge_pipe_filter_event_names
}

module "cloudwatch" {
  env                               = var.env
  source                            = "../../modules/cloudwatch"
  event_bus_arn                     = module.eventbridge.event_bus_arn
  dynamodb_function_name            = module.lambda.lambda_function_dynamodb_name
  s3_function_name                  = module.lambda.lambda_function_s3_name
  eventbridge_pipes_log_group_name  = var.eventbridge_pipes_log_group_name
  lambda_alarm_comparison_operator  = var.lambda_alarm_comparison_operator
  lambda_alarm_evaluation_periods   = var.lambda_alarm_evaluation_periods
  lambda_alarm_namespace            = var.lambda_alarm_namespace
  lambda_alarm_period               = var.lambda_alarm_period
  lambda_error_metric_name          = var.lambda_error_metric_name
  lambda_error_alarm_statistic      = var.lambda_error_alarm_statistic
  lambda_error_alarm_threshold      = var.lambda_error_alarm_threshold
  lambda_error_alarm_description    = var.lambda_error_alarm_description
  lambda_throttle_metric_name       = var.lambda_throttle_metric_name
  lambda_throttle_alarm_statistic   = var.lambda_throttle_alarm_statistic
  lambda_throttle_alarm_threshold   = var.lambda_throttle_alarm_threshold
  lambda_throttle_alarm_description = var.lambda_throttle_alarm_description
  lambda_alarm_topic_name           = var.lambda_alarm_topic_name
  protocol                          = var.protocol
  endpoint                          = var.endpoint
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
}