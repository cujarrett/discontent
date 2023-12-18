resource "aws_secretsmanager_secret" "secret" {
  name = "discontent"
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = aws_secretsmanager_secret.secret.id
}

output "secret_name" {
  value = aws_secretsmanager_secret.secret.name
}

output "secret_arn" {
  value = aws_secretsmanager_secret.secret.arn
}
