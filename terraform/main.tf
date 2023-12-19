module "iam" {
  source = "./modules/iam"
}

module "archive" {
  source = "./modules/archive"
}

module "lambda" {
  source                       = "./modules/lambda"
  file_placeholder_output_path = module.archive.file_placeholder_output_path
  discontent_backend_role_arn  = module.iam.discontent_backend_role_arn
  error_sns_topic              = var.error_sns_topic
}
