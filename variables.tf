variable "name" {
  description = "Create a name"
}

variable "node_type" {
  description = "dc2.large"
}

variable "database_name" {
  description = "Database Name"
}

variable "database_name" {
  description = "Database name"
}

variable "database_password" {
  description = "Database password"
}


variable "database_password_ssm_key" {
  description = "Password stored in AWS SSM"
}

variable "security_group_ids" {
  description = "Security group ids"
}

variable "subnet_ids" {
  description = "Subnet ids"
}

variable "tags" {
  default = []
}

