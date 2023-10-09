# Terraform - AWS

 ## Criar arquivo de estado do Terraform

 1. criar buckte no S3
    a. nome: **terrafomr-state-park-tech**

2. deixar as demais configurações padrões.

## Terraform Backend S3
1. [Example Configuration
](https://developer.hashicorp.com/terraform/language/settings/backends/s3)

## iniciar execução

1. acessar o diretório de produção

```sh
cd /aws-beanstalk/env/prod/
```

2. iniciar o terraform

```sh
terraform init
```