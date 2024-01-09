output "discontent_backend_lambda_arn" {
  value = aws_lambda_function.discontent_backend.arn
}

output "discontent_backend_lambda_invoke_arn" {
  value = aws_lambda_function.discontent_backend.invoke_arn
}
