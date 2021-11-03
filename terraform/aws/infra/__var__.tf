variable "global_environment_name" {
  description = "A globally unique environment name for S3 buckets."
  type        = string
}

variable "aws_region" {
  description = "The AWS region in which to place the resources."
  type        = string
}

variable "db_password" {
  description = "Password for the database instance. NOTE: Database is not publicly accessible by default."
  type        = string
}

variable "wandb_vpc_id" {
    description = "VPC where WandDB will be deployed"
    type = string
}

variable "private_subnet_ids" {
    description = "Private subnets where the EKS cluster and load balancers will be deployed"
    type = list(string)
}

variable "private_rds_subnet_ids" {
    description = "Private subnets where the RDS instances will be deployed"
    type = list(string)
}

variable "wandb_ingress_ips" {
    description = "IP ranges to allow 80/443 connections to wandb load balancers and 443 connection to EKS cluster"
    type = list(string)
}