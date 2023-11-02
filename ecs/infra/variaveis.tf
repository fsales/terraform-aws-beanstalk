## variaveis

variable "nome_repositorio" {
    type = string
    description = "Nome do repositório"
}

variable "cargoIAM" {
  type = string
}

variable "ambiente" {
  type = string
}

/** container **/

variable "containerPort" {
  type = number
  description = "Porta utilizada pelo contaneir"
}

variable "hostPort" {
  type = number
  description = "hostPort utilizada pelo contaneir"
}

variable "albPort" {
  type = number
  description = "Porta utilizada pelo load balancer"
}

variable "nomeResource" {
  type = string
  description = "Nome dos Recursos"
}

variable "containerName" {
  type = string
  description = "Nome do container"
}


variable "environment" {
  type    = map(object({
    name  = string,
    value = string
  }))
  default = {}
}

/*
variable "teste" {
  description = "Secret variable"
  type        = string
  sensitive   = true
}*/
