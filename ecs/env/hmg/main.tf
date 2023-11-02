module "prod" {
  source = "../../infra"

  nomeResource = "django"
  nome_repositorio = "homologacao"
  cargoIAM = "homologacao"
  ambiente = "homologacao"
  containerPort = 8080
  hostPort = 8080
  albPort = 8080
}

##
output "ip_abl" {
  value = module.prod.ip
}