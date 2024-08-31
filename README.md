This Terraform configuration creates a basic infrastructure on AWS, including a VPC, subnets, route tables, security groups, network interfaces, Elastic IPs, and EC2 instances. The structure is designed to build a secure and accessible environment for hosting resources in a custom VPC. The resources created include:

VPC (Virtual Private Cloud)
Subnet
Internet Gateway (IGW)
Route Table and Route Table Association
Security Group
Network Interface
Elastic IP (EIP)
EC2 Instance

 #By Using putty you can login in to your instance and install the apache2 

 (You may face the error in attaching the Elastic IP(aws_eip.demo_random), Run "terraform apply --auto-approve" again )

 (apply "terraform refresh" to get output for public_ip of instance)
