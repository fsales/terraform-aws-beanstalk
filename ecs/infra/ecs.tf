module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = var.ambiente

  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = "/aws/ecs/aws-ec2"
      }
    }
  }

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }

}

# task definition
resource "aws_ecs_task_definition" "django_api_tks" {
  family                   = "django-api-tks"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.cargo.arn
  container_definitions = jsonencode([
    {
      "name"      = "producao"
      "image"     = "145439845532.dkr.ecr.us-west-2.amazonaws.com/producao:v1"
      "cpu"       = 256
      "memory"    = 512
      "essential" = true
      "portMappings" : [
        {
          "containerPort" = 8000
          "hostPort"      = 8000
        }
      ]
    }
  ])
}

# service
resource "aws_ecs_service" "django_api_ecs_svc" {
  name            = "django-api-ecs-svc"
  cluster         = module.ecs.cluster_id
  task_definition = aws_ecs_task_definition.django_api_tks.arn
  desired_count   = 3
     
  load_balancer {
    target_group_arn = aws_lb_target_group.tg_ecs_django.arn
    container_name   = "producao"
    container_port   = 8000
  }

  ## Criar network (obrigatório quando trabalha com VPC)
  network_configuration {
      subnets = module.vpc.private_subnets
      security_groups = [aws_security_group.privado.id]
  }

  ## 
  capacity_provider_strategy {
      capacity_provider = "FARGATE"
      weight = 1 #100/100
  }
}

