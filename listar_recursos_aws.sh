#!/bin/bash

#chmod +x listar_recursos_aws.sh

# Obtém a lista de regiões da AWS
regions=$(aws ec2 describe-regions --query 'Regions[].RegionName' --output text)

# Itera sobre cada região
for region in $regions; do
    echo "Recursos em execução na região: $region"
    
    # Lista instâncias EC2 na região atual
    echo "Instâncias EC2:"
    aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name]' --output table --region $region
    
    # Lista buckets S3 na região atual
    echo "Buckets S3:"
    aws s3api list-buckets --query 'Buckets[*].Name' --output table --region $region
    
    # Lista bancos de dados RDS na região atual
    echo "Bancos de dados RDS:"
    aws rds describe-db-instances --query 'DBInstances[*].[DBInstanceIdentifier, DBInstanceClass, DBInstanceStatus]' --output table --region $region
    
    # Lista filas do SQS na região atual
    echo "Filas do SQS:"
    aws sqs list-queues --query 'QueueUrls' --output table --region $region

    # Lista Load Balancers na região atual
    echo "Load Balancers:"
    aws elbv2 describe-load-balancers --query 'LoadBalancers[*].[LoadBalancerName,DNSName]' --output table --region $region

    # Lista clusters do ECS na região atual
    echo "Clusters do ECS:"
    aws ecs list-clusters --query 'clusterArns' --output table --region $region

    # Lista repositórios do ECR na região atual
    echo "Repositórios do ECR:"
    aws ecr describe-repositories --query 'repositories[*].[repositoryName]' --output table --region $region
    
    echo "-----------------------------------------"
done
