# EcrRepository for api
resource "aws_ecr_repository" "git_action_repository" {
  name                 = "git_action_repository"
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

