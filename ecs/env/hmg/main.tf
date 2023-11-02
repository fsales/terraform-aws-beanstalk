module "hmg" {
  source = "../../infra"

  nome_repositorio = "producao"
  cargoIAM         = "producao"
  ambiente         = "producao"
  containerPort    = 8080
  hostPort         = 8080
  albPort          = 8080
  nomeResource     = "park-tech"
  containerName    = "park-tech"


  environment = {
    "PROFILE_ENVIRONMENT" = {
      name  = "PARK_TECH_PROFILE_ENVIRONMENT",
      value = "cloud-atlas"
    },
    "DATABASE" = {
      name  = "PARK_TECH_MONGODB_DATABASE",
      value = "parktech"
    },
    "DATABASE_URI" = {
      name  = "PARK_TECH_MONGODB_URI",
      value = var.uriDatabase
    }
  }
}

output "ip_abl" {
  value = module.hmg.ip
}
