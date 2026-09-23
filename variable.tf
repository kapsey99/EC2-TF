variable "aws_region" {
  type        = string
  description = "The target AWS Region for all resources"
  default     = "us-east-1"
}

variable "ami_id" {
  type        = string
  description = "The AMI ID used to launch the EC2 instance"
  default     = "ami-0fef201115eefe936"
}

variable "instance_type" {
  type        = string
  description = "The size/type of the EC2 compute instance"
  default     = "t3.micro"
}

variable "instance_name" {
  type        = string
  description = "Value for the Name tag of the EC2 instance"
  default     = "EC2-TF"
}

variable "key_name" {
  type        = string
  description = "The logical registration name for the AWS Key Pair"
  default     = "ec2-key-pair"
}
