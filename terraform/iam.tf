resource "aws_iam_role" "main_role" {
  name = "main_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid : ""
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "ecr_policy" {
  name = "ecr_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "ecr_attach" {
  name       = "ecr_attach"
  roles      = ["${aws_iam_role.main_role.name}"]
  policy_arn = aws_iam_policy.ecr_policy.arn
}
