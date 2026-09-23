resource "aws_instance" "terraform_ec2"{
    ami = "ami-0fef201115eefe936"
    instance_type = "t3.micro"
    key_name = aws_key_pair.ec2-key.key_name

    tags = {
        Name = "EC2-TF"
    }
}

resource "tls_private_key" "RSA"{
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "ec2-key"{
    key_name = "ec2-key-pair"
    public_key = tls_private_key.RSA.public_key_ossh
}

resource "local_file" "private-key"{
    content = tls_private_key.RSA.private_key_pem
    filename = 
    file_permission = "0440"
}
