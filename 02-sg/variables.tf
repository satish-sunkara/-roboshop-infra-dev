variable "common_tags" {
  type = map 
  default = {
    Project_name = "roboshop"
    Environment = "dev"
    Terraform = true
  }
}

variable "aws_security_group_tags" {
  default = {}
}

variable "project_name" {
    default = "roboshop"
}

variable "environment" {
  default = "dev"
}


variable "sg_ingress_rules" {
  default = [
    {
            description      = "Allow 8080 port"
            from_port        = 80  # 0 means all ports
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allow 443 port"
            from_port        = 443  
            to_port          = 443
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }
  ]
}