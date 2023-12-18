variable "discontent_backend_role_arn" {
  description = "IAM role ARN"
  type        = string
}

variable "file_placeholder_output_path" {
  description = "Placeholder content for Lambda"
  type        = string
}

variable "secret_name" {
    description = "Secret name"
    type        = string
}

variable "error_sns_topic" {
  description = "SNS Topic ARN to trigger on lambda failure"
  type        = string
}
