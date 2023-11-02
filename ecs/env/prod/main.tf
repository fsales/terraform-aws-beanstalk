module "prod" {
  source = "../../infra"

  nomeResource = "django"
  nome_repositorio = "producao"
  cargoIAM = "producao"
  ambiente = "producao"
  containerPort = 8080
  hostPort = 8080
  albPort = 8080
}

##
output "ip_abl" {
  value = module.prod.ip
}