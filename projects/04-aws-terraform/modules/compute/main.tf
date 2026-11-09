resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-sg"
  description = "Security group for portfolio EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access from KodeKloud"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}
