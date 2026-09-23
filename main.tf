data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# create EC2 instance
resource "aws_instance" "terraform_ec2"{
    ami = "ami-0fef201115eefe936"
    instance_type = "t3.micro"
    key_name = aws_key_pair.ec2-key.key_name
    subnet_id     = data.aws_subnets.default.ids[0]

    tags = {
        Name = "EC2-TF"
    }
}

# create public & private key pair
resource "tls_private_key" "RSA"{
    algorithm = "RSA"
    rsa_bits = 4096
}

# register the key pair with AWS
resource "aws_key_pair" "ec2-key"{
    key_name = "ec2-key-pair"
    public_key = tls_private_key.RSA.public_key_openssh
}

# store the private key locally 
resource "local_file" "private-key"{
    content = tls_private_key.RSA.private_key_pem
    filename = "${path.module}/ec2-key-pair.pem"
    file_permission = "0400"
}
