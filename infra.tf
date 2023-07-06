

# # Configure the AWS Provider

# #provider "aws" {

#  # region = "ap-south-1"

# #}

# # resource "aws_instance" "example" {
#  # ami           = "ami-0b9ecf71fe947bbdd"
#  #instance_type = "t2.micro"
# #key_name = "Demo_28 June"
#    #tags = {

#    #Name = "Hello world"

   

#  # }

# #}


# # creating Hyd VPC
# #resource "aws_vpc" "Hyd-Vpc" {
#   #cidr_block       = "10.0.0.0/16"
  

#  #tags = {
#     Name = "Hyd-Vpc"
#   }
# }
# # creating subnets resources
# #resource "aws_subnet" "Hyd-subnet-1a" {
#  # vpc_id     = aws_vpc.Hyd-Vpc.id
#   #cidr_block = "10.0.1.0/24"
# #   #availability_zone = "ap-south-1a"
# #   map_public_ip_on_launch = "true"
# #   tags = {
# #     Name = "Hyd-subnet-1a"
# #   }
# # }

# # # Creating ec2 instance
# # resource "aws_instance" "hyd-instance" {
# #   ami           = "ami-0b9ecf71fe947bbdd"
# #   instance_type = "t2.micro"
# #   key_name = aws_key_pair.hyd-key-pair.id
# #   subnet_id = aws_subnet.Hyd-subnet-1a.id
# #   associate_public_ip_address = "true"
# #   vpc_security_group_ids = [aws_security_group.hyd_SG_allow_ssh_http.id]

# #   tags = {
# #     Name = "hyd-instance"
# #   }
# # }

#creating Key pair resource
# resource "aws_key_pair" "hyd-key-pair" {
#   key_name   = "hyd-1st-july"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHLdrECQ8LrW9Bqdsa5lRTIX/gXYp+n58W7Nf7S7sRvIbto7Vi2WHAcpEZv1TImZY1ClzmU04Yg04gF5FE98d55fRDE05vpWpLsob6rN+LFMTomkrG8pkV0rokCAEk5HO2ji/5aMN2zg/Kbf0ANp+K3N9aDRkYeeTi3XxJbEJPFFMXJhHVFGzCBemlVEpaKKGd5GjvrGekfyPYgwNnerBZGE7qN6ehEcGOSqksCKuZxBS84bU4jOMA8CK7vIBJ7s4vYAcnrUIX6ZDKefPTpq/iShKHEuH993gD8sRu2PulpI0pf7G+GglVS0qp6cel/VhKIebOwpq3GQ5rJW5MB6PLZ0Y6ge2OxfNR4GuUrjsHKf5/kh7UU1Ydqd08L6OUMqTV3r9BCNsivc5mzoBgz4d0UnjYdr6wNND20WAHicU01FWIZATtZwiI/AmfH+RIHBefqdYP3pSFi2VxjU+hrDYd3+/d9c8hodC4WJ20s4GT0QZXeA2+AhCTRhtM8JvY+fM= DELL@DESKTOP-ADELVQ9"
# }

# # Creating security group
# resource "aws_security_group" "hyd_SG_allow_ssh_http" {
#   name        = "allow_ssh_http"
#   description = "Allow SSH and HTTP inbound traffic"
#   vpc_id      = aws_vpc.Hyd-Vpc.id

#   ingress {
#     description      = "SSH from PC"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   ingress {
#     description      = "HTTP from PC"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
    
#   }

#   tags = {
#     Name = "allow_ssh_http"
#   }
# }



#-------------------------------------------------------------------

#project

terraform {
required_providers {
aws = {
source  = "hashicorp/aws"
 version = "~> 4.0"
 }
 }
}


  terraform {
  backend "s3" {
    bucket = "terraform-state-file-bucket-5th-july"
    key    = "terraform-infra-file.tf"
    region = "ap-south-1"
  }
}


#creating Mumbai VPC

resource "aws_vpc" "Mumbai-VPC" {
  cidr_block       = "10.0.0.0/16"
  

  tags = {
    Name = "Mumbai-VPC"
  }
}

#Creating the Subnet
resource "aws_subnet" "Mumbai-subnet-1a-pub" {
  vpc_id     = aws_vpc.Mumbai-VPC.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "true"


  tags = {
    Name = "Mumbai-subnet-1a"
  }
}

resource "aws_subnet" "Mumbai-subnet-1a" {
  vpc_id     = aws_vpc.Mumbai-VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"


  tags = {
    Name = "Mumbai-subnet-1a"
  }
}

resource "aws_subnet" "Mumbai-subnet-1b-pub" {
  vpc_id     = aws_vpc.Mumbai-VPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = "true"


  tags = {
    Name = "Mumbai-subnet-1b"
  }
}

resource "aws_subnet" "Mumbai-subnet-1b" {
  vpc_id     = aws_vpc.Mumbai-VPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1b"


  tags = {
    Name = "Mumbai-subnet-1b"
  }
}

 #Creating security group
resource "aws_security_group" "mumbai_SG_allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.Mumbai-VPC.id

  ingress {
    description      = "SSH from PC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from PC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "allow_ssh_http"
  }
}

#creating internet gateway
resource "aws_internet_gateway" "Mumbai-IG" {
  vpc_id = aws_vpc.Mumbai-VPC.id

  tags = {
    Name = "Mumbai-IG"
  }
}

# Creating the RT

resource "aws_route_table" "mumbai-RT-pub" {
  vpc_id = aws_vpc.Mumbai-VPC.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Mumbai-IG.id
  }

  tags = {
    Name = "Mumbai-RT"
  }
}

resource "aws_route_table" "mumbai-RT-2" {
  vpc_id = aws_vpc.Mumbai-VPC.id

  tags = {
    Name = "Mumbai-RT"
  }
}


resource "aws_route_table_association" "mumbai-RT-associaciation-1" {
  subnet_id      = aws_subnet.Mumbai-subnet-1a-pub.id
  route_table_id = aws_route_table.mumbai-RT-pub.id
}

resource "aws_route_table_association" "mumbai-RT-associaciation-2" {
  subnet_id      = aws_subnet.Mumbai-subnet-1b-pub.id
  route_table_id = aws_route_table.mumbai-RT-pub.id
}

resource "aws_route_table_association" "mumbai-RT-associaciation-3" {
  subnet_id      = aws_subnet.Mumbai-subnet-1a.id
  route_table_id = aws_route_table.mumbai-RT-2.id
}

resource "aws_route_table_association" "mumbai-RT-associaciation-4" {
  subnet_id      = aws_subnet.Mumbai-subnet-1b.id
  route_table_id = aws_route_table.mumbai-RT-2.id
}

#creating Key pair resource
resource "aws_key_pair" "mumbai-key-pair" {
 key_name   = "Mumbai-4th-july"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjGzXM5TSjeeIFoqvy2XzpOWLZ3GZVRCzMgZRiSoB6NI1cTgb4lUzazIjymZfV5FyPO/d1RF4uwxqAZqRTzy3AhjNu4BS8FMR58Ixc5JGBhrqAqWyqeTBFzYB37tAW0UBOzO+4nCcgK5SsF+gNU13+1BYY/cQCN03OqAoQkIyHOQHyBisKoDvt0lo6Do3YGpv7aZ7n2u8RacLatd1+EG0MguttqhJN5eMT40C3tsa9sY9+0QWMfFVDw6ccJg6OwyO3goMJJ1Rxi5wSDPtTCzZmm10ZzZWOlNUrmOKmIcaHYkKc/1S004wiEojYvmW46R9vffAYMDNcMzIpC679QVKukJFzIClCh5RcO0MrqyrWgWVLVPfOavet5lNWSg0ZyrMKBMbv88gMhCCeJfhiX1dnOBnCCuAW9vXpnq/dOry2Ef3nS0YslZu3zUJyuSTYeZILAEkyVT8MHLS25zAdKAYR/pRUGmhiMvz/imVD4DFhFQ+gsTyJxOi31resBCYBwMM= DELL@DESKTOP-ADELVQ9"

}

  # Creating Target group
  
  resource "aws_lb_target_group" "mumbai-TG" {
  name     = "Terraform-Project"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Mumbai-VPC.id
}

#Creaing launch template
resource "aws_launch_template" "Mumbai-LT" {
  name = "mumbai-LT"

  image_id =  "ami-0f5ee92e2d63afc18"
 instance_type = "t2.micro"
key_name = aws_key_pair.mumbai-key-pair.id

  monitoring {
    enabled = true
  }

  placement {
    availability_zone = "us-west-2a"
  }

  vpc_security_group_ids = [aws_security_group.mumbai_SG_allow_ssh_http.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "mumbai-instance-ASG"
    }
  }

  user_data = filebase64("userdata.sh")
}
# creating ASG
resource "aws_autoscaling_group" "mumbai-ASG" {
  vpc_zone_identifier = [aws_subnet.Mumbai-subnet-1a-pub.id,aws_subnet.Mumbai-subnet-1b-pub.id]
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.Mumbai-LT.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.mumbai-TG.arn]
}

#creating listener with ASG
resource "aws_lb_listener" "Mumbai-listener" {
  load_balancer_arn = aws_lb.mumbai-LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mumbai-TG.arn
  }
}
# creating Load balancer 
resource "aws_lb" "mumbai-LB" {
  name               = "Mumbai-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mumbai_SG_allow_ssh_http.id]
  subnets            = [aws_subnet.Mumbai-subnet-1a-pub.id,aws_subnet.Mumbai-subnet-1b-pub.id]


  tags = {
    Environment = "production"
  }
}