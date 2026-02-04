variable "name" { type = string }
variable "vpc_id" { type = string }
variable "private_subnet_id" { type = string }

variable "instance_type" { type = string default = "t3.small" }
variable "instance_profile_name" { type = string }

variable "allowed_ssh_cidr" {
  type        = string
  description = "Optional: CIDR allowed for SSH (keep tight)."
  default     = "0.0.0.0/0"
}

variable "tags" { type = map(string) default = {} }
