module "homologacao" {
  source = "../../infra"

  nome = "homologacao"
  descricao = "aplicacao-homologacao"
  ambiente = "ambiente-homologacao"
  max = 1
  maquina = "t2.micro"


}