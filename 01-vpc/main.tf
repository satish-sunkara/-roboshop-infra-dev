module "roboshop" {
    source = "git::https://github.com/satish-sunkara/terraform-aws-vpc.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    aws_vpc_tags = var.aws_vpc_tags

    #public subnet
    public_vpc_cidr = var.public_vpc_cidr

    #private subnet
    private_vpc_cidr = var.private_vpc_cidr

    #database subnet
    database_vpc_cidr = var.database_vpc_cidr

    #peering
    is_peering_required = var.is_peering_required
  
}