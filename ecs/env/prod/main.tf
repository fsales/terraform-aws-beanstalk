module "prod" {
  source = "../../infra"

  nome_repositorio = "producao"
  cargoIAM = "producao"
  ambiente = "producao"
}

##
output "ip_abl" {
  value = module.prod.ip
}