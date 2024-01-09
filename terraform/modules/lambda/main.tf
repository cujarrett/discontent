resource "aws_lambda_function" "discontent_backend" {
  filename      = var.file_placeholder_output_path
  function_name = "discontent-backend"
  handler       = "index.handler"
  role          = var.discontent_backend_role_arn
  runtime       = "nodejs20.x"
  memory_size   = 512
  timeout       = 60
}

resource "aws_lambda_function_event_invoke_config" "discontent_backend_event_invoke_config" {
  function_name                = aws_lambda_function.discontent_backend.arn
  maximum_event_age_in_seconds = 60
  maximum_retry_attempts       = 0

  destination_config {
    on_failure {
      destination = var.error_sns_topic
    }
  }
}

resource "aws_lambda_permission" "discontent_backend" {
  statement_id  = "AllowExecutionFromAlexa"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.discontent_backend.arn
  principal     = "alexa-appkit.amazon.com"
}

output "discontent_backend_lambda_arn" {
  value = aws_lambda_function.discontent_backend.arn
}

output "discontent_backend_lambda_invoke_arn" {
  value = aws_lambda_function.discontent_backend.invoke_arn
}
