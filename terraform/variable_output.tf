# Variables to show after the deployment
#########################################

output "public_ip" {
  value = aws_instance.app_python.public_ip
}