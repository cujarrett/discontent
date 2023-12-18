module "iam" {
  source = "./modules/iam"
}

module "secrets_manager" {
  source = "./modules/secrets_manager"
}

module "archive" {
  source = "./modules/archive"
}

module "lambda" {
  source                       = "./modules/lambda"
  file_placeholder_output_path = module.archive.file_placeholder_output_path
  discontent_backend_role_arn  = module.iam.discontent_backend_role_arn
  secret_name                  = module.secrets_manager.secret_name
  error_sns_topic              = var.error_sns_topic
}
