# Terraform - AWS

## Curso Alura
1. [Infraestrutura como código: Docker e Elastic Beanstalk na AWS](https://cursos.alura.com.br/course/infraestrutura-codigo-docker-elastic-beanstalk-aws)


 ## Criar arquivo de estado do Terraform

 1. criar buckte no S3
    a. nome: **terrafomr-state-park-tech**

2. deixar as demais configurações padrões.

## Terraform Backend S3
1. [Example Configuration
](https://developer.hashicorp.com/terraform/language/settings/backends/s3)

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

## Deploy

1. criar o arquivo Dockerrun.aws
2. criar uma arquivo zip para subir o Dockerrun.aws para AWS Beanstalk
3. aplicar as alterações na AWS.

```sh
terraform apply
```
4. atualizar a versão atraves do CLI da AWS 
   
```sh
aws elasticbeanstalk update-environment --environment-name ambiente-producao --version-label ambiente-producao
```