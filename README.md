# Terraform - AWS

## Curso Alura
1. [Infraestrutura como código: Docker e Elastic Beanstalk na AWS](https://cursos.alura.com.br/course/infraestrutura-codigo-docker-elastic-beanstalk-aws)

2. [Infraestrutura como código: Terraform, Docker e Elastic Container Service](https://cursos.alura.com.br/course/infraestrutura-codigo-terraform-docker-elastic-container-service-aws)

 ## Criar arquivo de estado do Terraform

 1. criar buckte no S3
    a. nome: **terrafomr-state-park-tech**

1. deixar as demais configurações padrões.

## Terraform Backend S3
1. [Example Configuration
](https://developer.hashicorp.com/terraform/language/settings/backends/s3)

Obs.: O Buckets deve ser criando antes de aplicar as alterações via terraform.

## iniciar execução
1. configurar a credencial do CLI da AWS.
   
2. acessar o diretório de produção

```sh
cd /aws-beanstalk/env/prod/
```

3. iniciar o terraform

```sh
terraform init
```

4. verificar as alterações que o terraform irá executar

```sh
terraform plan
```

5. aplicar as alterações na AWS.

```sh
terraform apply
```

```sh
terraform apply -auto-approve
```

## Deploy

1. criar o arquivo Dockerrun.aws
2. criar uma arquivo zip para subir o Dockerrun.aws para AWS Beanstalk
3. aplicar as alterações na AWS.

```sh
terraform apply
```
4. atualizar a versão atraves do CLI da AWS 

* Produção 
```sh
aws elasticbeanstalk update-environment --environment-name ambiente-producao --version-label ambiente-producao
```

* homologação
```sh
aws elasticbeanstalk update-environment --environment-name ambiente-homologacao --version-label ambiente-homologacao
```

# Remover ambiente AWS

```sh
terraform destroy
```


## VPC - Virtual Private Cloud

# Como funciona

O Amazon Virtual Private Cloud (Amazon VPC) oferece controle total sobre seu ambiente de redes virtual, incluindo posicionamento de recursos, conectividade e segurança.Comece a usar configurando sua VPC no console de serviço AWS. Em seguida, adicione recursos a ela, como instâncias do Amazon Elastic Compute Cloud (EC2) e Amazon Relational Database Service (RDS). Por fim, defina como suas VPCs se comunicam entre si, entre contas, zonas de disponibilidade (AZs) ou Regiões da AWS. No exemplo
abaixo, o tráfego de rede está sendo compartilhado entre duas VPCs em cada região.