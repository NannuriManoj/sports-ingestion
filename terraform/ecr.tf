resource "aws_ecr_repository" "ecr-practice" {
  name = "docker-image-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}