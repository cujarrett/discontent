# Backend
data "aws_iam_policy_document" "discontent_backend_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "discontent_backend" {
  name               = "discontent-backend"
  assume_role_policy = data.aws_iam_policy_document.discontent_backend_assume_role_policy.json
}

# Logs
data "aws_iam_policy_document" "discontent_backend_logs_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*"
    ]
  }
}

resource "aws_iam_policy" "discontent_backend_logs" {
  name        = "discontent-backend-logs"
  description = "Adds logging access"
  policy      = data.aws_iam_policy_document.discontent_backend_logs_policy.json
}

resource "aws_iam_role_policy_attachment" "attach_logs" {
  role       = aws_iam_role.discontent_backend.name
  policy_arn = aws_iam_policy.discontent_backend_logs.arn
}

# SNS
data "aws_iam_policy_document" "discontent_backend_sns_policy" {
  statement {
    actions = [
      "sns:Publish"
    ]
    resources = [
      var.error_sns_topic
    ]
  }
}

resource "aws_iam_policy" "discontent_backend_sns" {
  name        = "discontent-backend-sns"
  description = "Adds sns access"

  policy = data.aws_iam_policy_document.discontent_backend_sns_policy.json
}

resource "aws_iam_role_policy_attachment" "attach_sns" {
  role       = aws_iam_role.discontent_backend.name
  policy_arn = aws_iam_policy.discontent_backend_sns.arn
}
