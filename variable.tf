variable "vpc-1" {
    description = "cidr block for vpc"
    default = "10.0.0.0/16"
    type = string 
}

variable "subnet-1" {
    description = "cidr block for subnet"
    default = "10.0.1.0/24"
    type = string 
}
variable "AZ-subnet-1" {
    description = "availability_zone for the subnet"
    default = "us-east-1a"
    type = string 
}

variable "route-table-1" {
    description = "cidr block for route table"
    default = "0.0.0.0/0"
    type = string 
}

variable "private-ip" {
    description = "ip for network interface"
    default = "10.0.1.50"
    type = string 
}

variable "AMI" {
    description = "ami for instance"
    default = "ami-0a0e5d9c7acc336f1"
    type = string 
}

variable "Instance-type" {
    description = "Intance type for EC2 instance"
    default = "t2.micro"
    type = string 
}

variable "AZ-Instance" {
    description = "availability_zone for the Instance"
    default = "us-east-1a"
    type = string 
}

variable "key-pair" {
    description = "key pair name for our instance"
    default = "project1-key"
    type = string 
}





