variable "aws_region" {
  default = "us-west-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0e6a50b0059fd2cc3"
}

variable "key_name" {
  default = "jenkinsmumbai"
}

variable "jarvis_repo_url" {
  default = ""
}

variable "sw_sg" {
    default = "sw_sg"
  
}