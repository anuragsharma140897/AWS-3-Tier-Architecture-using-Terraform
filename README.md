# AWS_3tier_architecture_using_terraform

Deploying a 3-Tier Architecture in AWS Using Terraform using below AWS Services.

Explanation :

* Architecture is built with 2 public subnet and 1 private subnet in cutom built VPC.
* each subnet is deployed with one Ec2 instance. 
* Two EC2 Instance deployed in two Public subnets which are routed to internet with internet gateway attached in custom created route table. 
  Elastic ip is assigned to public Ec2 instance for fixed ip.
* Security Group with ingress rule with port 22 and 80 which is attached to both public Ec2 instances for SSH and HTTP connection.
* Apache webserver is installed in both public Ec2 instance.
* EC2 Instance for Dynamo DB Database deployed in Private subnet is routed to internet with NAT Gatewat deployed in one of public subnet 
  attached to default route table.
* Security Group with ingress rule with port 22 and 3306 is attached to Private Ec2 instance for SSH and RDP connection.
* Whole infra is deployed behind Load balancer to distribute traffic.
* Whole infra is deployed using terraform (Iaac).

Resource used :

* Custom VPC

* 2 Subnets (Public)

* 1 Subnet (Private)

* 2 EC2 Instances

* Security Group

* Elastic IP

* NAT Gateway

* Internet Gateway

* Route Table

* Application Load Balancer

* Apache Webserver

* Dynamo DB





![Screenshot 2022-06-28 at 7 57 51 AM](https://user-images.githubusercontent.com/58227542/176078468-3847bab0-e70e-4360-b077-181315ee007c.png)
