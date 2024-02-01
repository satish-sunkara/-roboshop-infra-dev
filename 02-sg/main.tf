module "vpn" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for vpn"
    vpc_id = data.aws_vpc.default.id
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "vpn"
  
}



module "mongodb" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for Mongodb"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "mongodb"
  
}

module "catalogue" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for catalogue"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "catalogue"
  
}

module "cart" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for cart"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "cart"
  
}

module "user" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for user"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "user"
  
}

module "mysql" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for mysql"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "mysql"
  
}

module "rabbitmq" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description ="SG for rabbitmq"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "rabbitmq"
  
}

module "redis" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for redis"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "redis"
  
}

module "payment" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for payment"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "payment"
  
}

module "web" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "web"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "web"
  
}

module "shipping" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for shipping"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "shipping"
  
}

module "dispatch" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for dispatch"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "dispatch"
  
}

module "app-alb" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "SG for APP ALB"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.sg_ingress_rules
    sg_name = "app-alb"
  
}




resource "aws_security_group_rule" "vpn_home" {
    security_group_id = module.vpn.sg_id
    type              = "ingress"
    to_port = 0
    from_port = 65535
    protocol          = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "mongodb_vpn" {
    source_security_group_id = module.vpn.sg_id
    type              = "ingress"
    to_port = 22
    from_port = 22
    protocol          = "tcp"
    security_group_id = module.mongodb.sg_id

}


resource "aws_security_group_rule" "mongodb_catalogue" {
    source_security_group_id = module.catalogue.sg_id
    type              = "ingress"
    to_port = 27017
    from_port = 27017
    protocol          = "tcp"
    security_group_id = module.mongodb.sg_id

}


resource "aws_security_group_rule" "mongodb_user" {
    source_security_group_id = module.user.sg_id
    type              = "ingress"
    to_port = 27017
    from_port = 27017
    protocol          = "tcp"
    security_group_id = module.mongodb.sg_id

}

resource "aws_security_group_rule" "redis_user" {
    source_security_group_id = module.user.sg_id
    type              = "ingress"
    to_port = 27017
    from_port = 27017
    protocol          = "tcp"
    security_group_id = module.redis.sg_id

}

resource "aws_security_group_rule" "redis_cart" {
    source_security_group_id = module.cart.sg_id
    type              = "ingress"
    to_port = 6379
    from_port = 6379
    protocol          = "tcp"
    security_group_id = module.redis.sg_id

}

resource "aws_security_group_rule" "redis_vpn" {
    source_security_group_id = module.vpn.sg_id
    type              = "ingress"
    to_port = 22
    from_port = 22
    protocol          = "tcp"
    security_group_id = module.redis.sg_id

}

resource "aws_security_group_rule" "mysql_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}

resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}


resource "aws_security_group_rule" "rabbitmq_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  source_security_group_id = module.payment.sg_id
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "catalogue_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "catalogue_app-alb" {
  source_security_group_id = module.app-alb.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

# resource "aws_security_group_rule" "catalogue_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.catalogue.sg_id
# }

# resource "aws_security_group_rule" "catalogue_cart" {
#   source_security_group_id = module.cart.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.catalogue.sg_id
# }

resource "aws_security_group_rule" "user_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "user_app-alb" {
  source_security_group_id = module.app-alb.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}


# resource "aws_security_group_rule" "user_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.user.sg_id
# }

# resource "aws_security_group_rule" "user_payment" {
#   source_security_group_id = module.payment.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.user.sg_id
# }

resource "aws_security_group_rule" "cart_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_shipping" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_payment" {
  source_security_group_id = module.payment.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "shipping_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "shipping_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "payment_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.payment.sg_id
}

resource "aws_security_group_rule" "payment_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.payment.sg_id
}

resource "aws_security_group_rule" "web_vpn" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}

resource "aws_security_group_rule" "web_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}



