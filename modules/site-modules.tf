
// define an s3 backend here
terraform {
  backend "s3" {
    bucket = "zohar-tf-state"
    key = "site/terraform.tfstate"
    dynamodb_table = "tf-cloudschool-site"
    region = "eu-west-1"
  }
}

module "vpc" {
  source = "../"

  environment = "cloudschool"
  region = "eu-west-1"
  vpc_cidr =  "172.18.0.0/18"
  private_subnets = "172.18.0.0/19"  
  public_subnets  =   "172.18.32.0/19"

  //multiple azs neede to avoid an error in when applyin aws_db_subnet_group.default-subnet-group
  azs  =   "eu-west-1a, eu-west-1b"

  enable_dns_support = true
  enable_dns_hostnames = true

}

output "environment" {
  value = "${module.vpc.environment}"
}

output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}

output "admin_key_name" {
  value = "${module.vpc.admin_key_name}"
}


output "private_subnets" {
value = "${module.vpc.private_subnets}"
}


output "public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

provider "aws" {
  region = "eu-west-1"
}

