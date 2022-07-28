resource "aws_elb" "techtask" {
  name               = "techtask-terraform-elb"
  subnets = [aws_subnet.subnet.id]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port     = 8001
    instance_protocol = "https"
    lb_port           = 443
    lb_protocol       = "https"
    ssl_certificate_id = aws_iam_server_certificate.techtask_cert.arn
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.app_python.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "techtask-terraform-elb"
  }
}

resource "aws_iam_server_certificate" "techtask_cert" {
  name_prefix      = "techtask-cert"
  certificate_body = file("techtask.crt")
  private_key      = file("techtask.key")

  lifecycle {
    create_before_destroy = true
  }
}