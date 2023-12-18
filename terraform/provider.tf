provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      app = "discontent-backend"
    }
  }
}
