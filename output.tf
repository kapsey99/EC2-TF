output "ec2_public_ip_address" {
    value = aws_instance.terraform_ec2.public_ip
    description = This is the EC2 instance Public IP address
}

output "ec2_private_ip_address"{
    value = aws_instance.terraform_ec2.private_ip
    description = This is the EC2 instance Private IP address
}

