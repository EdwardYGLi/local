variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "license" {
  type    = string
}

#### TODO #####
## Need to store in TFE vault ##
#### TODO ####

variable "global_environment_name" {
  type    = string
  default = "cv-wandb-rnd-deploy"
}

variable "wandb_version" {
  description = "The version of wandb to deploy."
  type        = string
  default     = "0.9.43"
}

####
## For Socure, these variables should not be used. Everything will be in a private subnet ##
####

# variable "deployment_is_private" {
#   description = "If true, the load balancer will be placed in a private subnet."
#   type        = bool
#   default     = true
# }

# variable "kubernetes_api_is_private" {
#   description = "If true, the kubernetes API server endpoint will be private."
#   type        = bool
#   default     = true
# }

variable "wandb_vpc_id" {
  description = "VPC where WandDB will be deployed"
  type        = string
  default     = "vpc-085cc04fc6e325417"
}

variable "private_subnet_ids" {
  description = "Private subnets where the EKS cluster and load balancers will be deployed"
  type        = list(string)
  default     = ["subnet-09d9aac754fe6df12", "subnet-0a90797fb0a85e347", "subnet-03f3b5024a858526a"]
}

variable "private_rds_subnet_ids" {
  description = "Private subnets where the RDS instances will be deployed"
  type        = list(string)
  default     = ["subnet-09466e49d16de6a53", "subnet-066f9a50c2034e34b"]
}


variable "wandb_ingress_ips" {
  description = "IP ranges to allow 80/443 connections to wandb load balancers and 443 connection to EKS cluster"
  type        = list(string)
  default     = ["10.222.0.0/23", "10.10.0.0/16","10.240.0.0/16"]
}

#### TODO #####
## Need to store in TFE vault ##
#### TODO ####
variable "db_password" {
  description = "Password for WandDB instance"
  type        = string
}