################ Criando grupo de segurança rede publica###############################
resource "aws_security_group" "alb" {
  name        = "alb_ecs"
  vpc_id      = module.vpc.vpc_id
}

## Criando regras
resource "aws_security_group_rule" "entrada_alb" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}


resource "aws_security_group_rule" "saida_alb" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}


################ Criando grupo de segurança rede privada###############################
resource "aws_security_group" "privado" {
  name        = "privado_ecs"
  vpc_id      = module.vpc.vpc_id
}

## Criando regras
resource "aws_security_group_rule" "entrada_ecs" {
  type                           = "ingress"
  from_port                      = 0
  to_port                        = 0
  protocol                       = "-1"
  source_security_group_id       = aws_security_group.alb.id
  security_group_id = aws_security_group.privado.id
}

resource "aws_security_group_rule" "saida_ecs" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.privado.id
}
