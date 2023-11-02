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
resource "aws_ecs_task_definition" "app_api_tks" {
  family                   = "tks-api-${var.nomeResource}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.cargo.arn
  container_definitions = jsonencode([
    {
      "name"      = var.containerName
      "image"     = "docker.io/fosales/park-tech:0.0.1.6"
      "cpu"       = 256
      "memory"    = 512
      "essential" = true
      "portMappings" : [
        {
          "containerPort" = var.containerPort
          "hostPort"      = var.hostPort
        }
      ],
      "environment" = [
        for env_name, env_value in var.environment : {
          name  = env_value.name
          value = env_value.value
        }
      ]
    }
  ])
}

# service
resource "aws_ecs_service" "app_api_ecs_svc" {
  name            = "svc-ecs-api-${var.nomeResource}"
  cluster         = module.ecs.cluster_id
  task_definition = aws_ecs_task_definition.app_api_tks.arn
  desired_count   = 3

  load_balancer {
    target_group_arn = aws_lb_target_group.tg_ecs_app.arn
    container_name   = var.containerName
    container_port   = var.containerPort
  }

  ## Criar network (obrigatório quando trabalha com VPC)
  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.privado.id]
  }

  ## 
  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1 #100/100
  }
}

