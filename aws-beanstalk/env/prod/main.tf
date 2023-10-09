module "producao" {
  source = "../../infra"

  nome = "producao"
  descricao = "aplicacao-producao"
  ambiente = "ambiente-producao"
  max = 2
  maquina = "t2.micro"


}