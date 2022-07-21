resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.vpc.id
  name   = "security group"

  ingress = [{
    description      = "My public IP for HTTP"
    protocol         = var.sg_ingress_proto_tcp
    from_port        = var.sg_ingress_all_start_http
    to_port          = var.sg_ingress_all_end_http
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    },
    {
      description      = "SSH"
      from_port        = var.sg_ingress_ssh
      protocol         = var.sg_ingress_proto_tcp
      to_port          = var.sg_ingress_ssh
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]


  egress {
    description      = "All traffic"
    protocol         = var.sg_egress_proto
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_egress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false

  }

  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-sg"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "terra"
  public_key = file(var.public_key)
}