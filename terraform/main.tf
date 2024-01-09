module "iam" {
  source          = "./modules/iam"
  error_sns_topic = var.error_sns_topic
}

module "archive" {
  source = "./modules/archive"
}

module "lambda" {
  source                       = "./modules/lambda"
  error_sns_topic              = var.error_sns_topic
  discontent_backend_role_arn  = module.iam.discontent_backend_role_arn
  file_placeholder_output_path = module.archive.file_placeholder_output_path
}
