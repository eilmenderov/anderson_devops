provider "aws" {
	region		= "us-east-2"
}

# resource "aws_eip" "jenkins_static_ip" {
# 	instance	= aws_instance.ubuntu_18_jenkins_serv.id
# }

resource "aws_key_pair" "deployer" {
  key_name		= "deployer-key"
  public_key	= file("/Users/YOUR_USER/.ssh/id_rsa.pub")
}

resource "aws_instance" "ubuntu_18_jenkins_serv" {
	ami						= "ami-0b9064170e32bde34"
	instance_type			= "t3.micro"
	vpc_security_group_ids	= [aws_security_group.jenkins_serv.id]
	key_name				= aws_key_pair.deployer.id
	# count					= 0
	
	tags = {
		Name	= "jenkins_serv"
		Owner	= "OWNER_NAME"
		Project	= "final_task"
	}

	# lifecycle {
	# 	create_before_destroy = true
	# }
}

output "ubuntu_18_jenkins_serv_public_dns" {
	value = aws_instance.ubuntu_18_jenkins_serv.public_dns
}

resource "aws_security_group" "jenkins_serv" {
	name		= "jenkins_serv security group"
	description	= "anderson final_task project"

	dynamic "ingress" {
		for_each = ["80", "443", "8080", "22"]
		content {
			from_port	= ingress.value
			to_port		= ingress.value
			protocol	= "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
	}

	egress {
		from_port	= 0
		to_port		= 0
		protocol	= "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}


resource "aws_instance" "debian_go" {
	ami						= "ami-089fe97bc00bff7cc"
	instance_type			= "t2.micro"
	vpc_security_group_ids	= [aws_security_group.app_serv.id]
	key_name				= aws_key_pair.deployer.id
	# count					= 0

	tags = {
		Name	= "debian_go_serv"
		Owner	= "OWNER_NAME"
		Project	= "final_task"
	}
}

output "debian_go_public_dns" {
	value = aws_instance.debian_go.public_dns
}


resource "aws_instance" "debian_python" {
	ami						= "ami-089fe97bc00bff7cc"
	instance_type			= "t2.micro"
	vpc_security_group_ids	= [aws_security_group.app_serv.id]
	key_name				= aws_key_pair.deployer.id
	# count					= 0

	tags = {
		Name	= "debian_python_serv"
		Owner	= "OWNER_NAME"
		Project	= "final_task"
	}
}

output "debian_python_public_dns" {
	value = aws_instance.debian_python.public_dns
}


resource "aws_security_group" "app_serv" {
	name		= "app_serv security group"
	description	= "anderson final_task project"

	dynamic "ingress" {
		for_each = ["80", "443", "22"]
		content {
			from_port	= ingress.value
			to_port		= ingress.value
			protocol	= "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
	}

	egress {
		from_port	= 0
		to_port		= 0
		protocol	= "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}