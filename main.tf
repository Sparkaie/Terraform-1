
resource "aws_internet_gateway" "demo_IGW" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "MY_IGW"
  }
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = "${var.vpc-1}"

  tags = {
    Name = "MyVPC"
}
}

resource "aws_subnet" "demo_sub" {
  cidr_block = "${var.subnet-1}"
  vpc_id = aws_vpc.demo_vpc.id
  availability_zone = "${var.AZ-subnet-1}"
}

resource "aws_route_table" "demo_rt" {
  vpc_id = aws_vpc.demo_vpc.id 

  route {
    cidr_block = "${var.route-table-1}"
    gateway_id = aws_internet_gateway.demo_IGW.id 
  }

 

  tags = {
    Name = "MyRT"
  }
}

resource "aws_route_table_association" "demo_rt_as" {
  subnet_id      = aws_subnet.demo_sub.id
  route_table_id = aws_route_table.demo_rt.id 
}

resource "aws_security_group" "demo_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
   ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My_Security_Group"
  }
}

resource "aws_network_interface" "demo_ni" {
  subnet_id       = aws_subnet.demo_sub.id
  private_ips     = ["${var.private-ip}"]
  security_groups = [aws_security_group.demo_sg.id]

}


 resource "aws_eip" "demo_random" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.demo_ni.id
  associate_with_private_ip = "${var.private-ip}"
  depends_on = [aws_internet_gateway.demo_IGW  ]

}

resource "aws_instance" "demo_instance" {
  ami = "${var.AMI}"
  instance_type = "${var.Instance-type}"
  availability_zone = "${var.AZ-Instance}"
  key_name = "${var.key-pair}"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.demo_ni.id
  }

 

    tags = {
      Name = "MY_WEB_SERVER"
    }
}
// to get the public ip of instance 
output "public_ip"{
  value = aws_instance.demo_instance.public_ip
}