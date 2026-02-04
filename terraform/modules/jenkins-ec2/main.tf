data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "${var.name}-jenkins-sg"
  description = "Jenkins SG"
  vpc_id      = var.vpc_id

  # SSH - in real prod restrict heavily or use SSM only.
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # Jenkins UI (only if you plan to access; otherwise remove and use SSM port-forward)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.name}-jenkins-sg" })
}

resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = false

  iam_instance_profile = var.instance_profile_name

  tags = merge(var.tags, { Name = "${var.name}-jenkins" })
}
