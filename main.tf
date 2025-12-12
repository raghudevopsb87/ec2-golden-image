resource "aws_instance" "ami" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-09663d91a4fca31c9"]

  tags = {
    Name = "golden-image-instance"
  }
}

resource "null_resource" "ansible" {

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.ami.private_ip
    }

    inline = [
      "sudo dnf install python3.13-pip -y",
      "sudo pip3.11 install ansible"
    ]

  }

}

resource "aws_ami_from_instance" "ami" {
  name               = "roboshop-golden-image"
  source_instance_id = aws_instance.ami.id

  removed {
    lifecycle {
      destroy = true
    }
  }

}



