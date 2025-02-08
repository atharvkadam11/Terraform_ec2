resource "aws_key_pair" "my_key_pair" {
  key_name = "terraform_key"
  public_key = file("/Users/atharvkadam/Files/Cloud-DevOps-SRE/Terraform/Terraform_Advance/ec2/keys/terraform_key.pub")

}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
    name = "my_security_group"
    vpc_id = aws_default_vpc.default.id
   
   ingress {
        description = "To allow incoming"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     ingress {
        description = "To allow incoming for Jenkins"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "To allow outgoing traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_instance" "My_demo_instance" {
  ami           = "ami-04b4f1a9cf54c11d0"   
  instance_type = "t2.micro"
  key_name = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.my_security_group.name]
  user_data = file("/Users/atharvkadam/Files/Cloud-DevOps-SRE/Terraform/Terraform_Advance/ec2/install.sh")
    tags = {
        Name = "my_demo_instance_terraform"

    }
  
}