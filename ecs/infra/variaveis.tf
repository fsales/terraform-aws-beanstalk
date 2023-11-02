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
