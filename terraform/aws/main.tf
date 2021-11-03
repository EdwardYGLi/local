module "infra" {
  source = "./infra"

  global_environment_name = var.global_environment_name
  aws_region              = var.aws_region
  db_password             = var.db_password
  wandb_vpc_id            = var.wandb_vpc_id
  private_subnet_ids      = var.private_subnet_ids
  private_rds_subnet_ids  = var.private_rds_subnet_ids
  wandb_ingress_ips       = var.wandb_ingress_ips
  #vpc_cidr_block             = var.vpc_cidr_block
  #public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  #private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

module "kube" {
  source = "./kube"

  license                    = var.license
  wandb_version              = var.wandb_version
  kube_cluster_endpoint      = module.infra.eks_cluster_endpoint
  kube_cert_data             = module.infra.eks_cert_data
  file_storage_bucket_name   = module.infra.s3_bucket_name
  file_storage_bucket_region = module.infra.s3_bucket_region
  file_metadata_queue_name   = module.infra.sqs_queue_name
  database_endpoint          = module.infra.rds_connection_string
  token                      = module.infra.eks_cluster_token
}