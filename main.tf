resource "aws_instance" "web" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-09663d91a4fca31c9"]

  tags = {
    Name = "golden-image-instance"
  }
}





