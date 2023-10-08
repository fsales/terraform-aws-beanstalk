### AWS ECR
resource "aws_ecr_repository" "repositorio_ecr" {
  name                 = var.ecr_nome

}