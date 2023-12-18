module "iam" {
  source = "./modules/iam"
}

module "secrets_manager" {
  source = "./secrets_manager"
}

module "archive" {
  source = "./modules/archive"
}

module "lambda" {
  source                       = "./modules/lambda"
  file_placeholder_output_path = module.archive.file_placeholder_output_path
  discontent_backend_role_arn  = module.iam.discontent_backend_role_arn
}
