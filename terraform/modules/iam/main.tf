resource "aws_iam_role" "discontent_backend" {
  name               = "discontent-backend"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": {
    "Action": "sts:AssumeRole",
    "Principal": {
      "Service": "lambda.amazonaws.com"
    },
    "Effect": "Allow"
  }
}
POLICY
}

resource "aws_iam_policy" "discontent_backend_logs" {
  name        = "discontent-backend-logs"
  description = "Adds logging access"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_logs" {
  role       = aws_iam_role.discontent_backend.name
  policy_arn = aws_iam_policy.discontent_backend_logs.arn
}

output "discontent_backend_role_arn" {
  value = aws_iam_role.discontent_backend.arn
}
