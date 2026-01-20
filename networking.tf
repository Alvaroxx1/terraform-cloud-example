moved {
  from = aws_vpc.tf_cloud
  to   = module.vpc.aws_vpc.this
}
moved {
  from = aws_subnet.tf_cloud
  // migrating a single subnet
  to = module.vpc.aws_subnet.this["subnet_1"]
}

module "vpc" {
  source  = "app.terraform.io/terraform-org-ajdev/vpc/aws"
  version = "0.0.1"
  # insert required variables here
  vpc_config = {
    cidr_block = var.vpc_cidr
    name       = "terraform-cloud"
  }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1a"
    }
  }
}

# resource "aws_vpc" "tf_cloud" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name = "terraform-cloud"
#   }
# }

# resource "aws_subnet" "tf_cloud" {
#   cidr_block = var.subnet_cidr
#   vpc_id     = aws_vpc.tf_cloud.id
#   tags = {
#     Name = "terraform-cloud"
#   }
# }