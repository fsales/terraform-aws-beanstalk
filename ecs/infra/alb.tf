## Criando load balancer
resource "aws_lb" "alb_ecs" {
  name               = "alb-ecs-django"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_alb_ecs.id]
  subnets            = module.vpc.public_subnets

}



## Criar Listener Load Balancer - entrada
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb_ecs.arn
  port              = "8000"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_ecs_django.arn
  }
}

## Criando Target Group
resource "aws_lb_target_group" "tg_ecs_django" {
  name        = "tg-ecs-django"
  port        = 8000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}


## exibir o DNS do Load Balancer
output "ip" {
 value = aws_lb.alb_ecs.dns_name 
}