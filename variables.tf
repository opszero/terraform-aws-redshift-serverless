
variable "database_password_ssm_key" {
  description = "Password stored in AWS SSM"
}

variable "node_type" {
  description = "dc2.large"
}

variable "tags" {
    default = []
}