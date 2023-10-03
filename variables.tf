variable "create" {
  type        = bool
  default     = true
  description = "Determines whether to create Redshift cluster and resources (affects all resources)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources"
}

variable "create_random_password" {
  type        = bool
  default     = true
  description = "Determines whether to create random password for cluster `master_password`"
}

variable "random_password_length" {
  type        = number
  default     = 16
  description = "Length of random password to create. Defaults to `16`"
}

variable "default_iam_role_arn" {
  type        = string
  default     = null
  description = "The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the cluster was created"
}

variable "subnet_ids" {
  type        = list(string)
  default     = null
  description = "An array of VPC subnet IDs to use in the subnet group"
}

variable "security_group_ids" {
  type        = list(any)
  default     = []
  description = "An array of security group IDs to associate with the workgroup."
}

variable "iam_roles" {
  type        = list(any)
  default     = []
  description = "A list of IAM roles to associate with the namespace."
}

variable "namespace_name" {
  type        = string
  default     = ""
  description = "The name of the namespace."
}

variable "admin_username" {
  type        = string
  default     = ""
  description = "The username of the administrator for the first database created in the namespace."
}

variable "admin_user_password" {
  type        = string
  default     = ""
  description = "The password of the administrator for the first database created in the namespace."
}

variable "db_name" {
  type        = string
  default     = ""
  description = "The name of the first database created in the namespace."
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "The ARN of the Amazon Web Services Key Management Service key used to encrypt your data."
}

variable "log_exports" {
  type        = list(string)
  default     = []
  description = "The types of logs the namespace can export. Available export types are userlog, connectionlog, and useractivitylog."
}

variable "workgroup_name" {
  type        = string
  default     = ""
  description = "The name of the workgroup."
}

variable "policy_name" {
  type        = string
  default     = ""
  description = "The name of the iam policy name."
}
variable "base_capacity" {
  type        = number
  default     = 28
  description = "The base data warehouse capacity of the workgroup in Redshift Processing Units (RPUs)."
}

variable "enhanced_vpc_routing" {
  type        = bool
  default     = null
  description = "If `true`, enhanced VPC routing is enabled"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "If true, the cluster can be accessed from a public network"
}


variable "config_parameter" {
  type        = list(any)
  default     = []
  description = "An array of parameters to set for more control over a serverless database."
}

variable "breach_action" {
  type        = string
  default     = "log"
  description = "The action that Amazon Redshift Serverless takes when the limit is reached. Valid values are log, emit-metric, and deactivate. The default is log."
}

variable "period" {
  type        = string
  default     = "monthly"
  description = "The time period that the amount applies to. A weekly period begins on Sunday. Valid values are daily, weekly, and monthly. The default is monthly."
}

variable "usage_type" {
  type        = string
  default     = "serverless-compute"
  description = "The type of Amazon Redshift Serverless usage to create a usage limit for. Valid values are serverless-compute or cross-region-datasharing."
}

variable "amount" {
  type        = number
  default     = 60
  description = "The limit amount. If time-based, this amount is in Redshift Processing Units (RPU) consumed per hour. If data-based, this amount is in terabytes (TB) of data transferred between Regions in cross-account sharing. The value must be a positive number."
}

variable "endpoint_name" {
  type        = string
  default     = ""
  description = "The Redshift-managed VPC endpoint name"
}

variable "snapshot_name" {
  type        = string
  default     = ""
  description = "The name of the snapshot."
}

variable "retention_period" {
  type        = string
  default     = "-1"
  description = "How long to retain the created snapshot. Default value is -1."
}

variable "endpoint_enable" {
  type        = bool
  default     = true
  description = "If `true`,  VPC endpoint is enabled"
}

variable "snapshot_enable" {
  type        = bool
  default     = false
  description = "If `true`, snapshot is enabled"
}

variable "snapshot_policy_enable" {
  type        = bool
  default     = false
  description = "If `true`, snapshot policy is enabled"
}

variable "policy" {
  type        = any
  default     = null
  description = "If `true`, iam policy is enabled"
}

variable "serverless_resource_policy" {
  type        = any
  default     = null
  description = "If `true`, serverless resource policy is enabled"
}

variable "assume_role_policy" {
  sensitive   = true
  type        = any
  default     = null
  description = "Policy that grants an entity permission to assume the role."
}

variable "iam_role_name" {
  type        = string
  default     = ""
  description = "The name of the iam role"
}

variable "policy_enabled" {
  type        = bool
  default     = true
  description = "Whether to Attach Iam policy with role."
}

variable "policy_arn" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The ARN of the policy you want to apply."
}

variable "kms_alias" {
  type        = string
  default     = "alias/redshift-serverless"
  description = "The display name of the alias. The name must start with the word 'alias' followed by a forward slash (alias/)"
}

variable "iam_role_enabled" {
  type        = bool
  default     = true
  description = "If `true`, iam role resource is enabled"
}

variable "kms_enabled" {
  type        = bool
  default     = true
  description = "If `true`, kms key is enabled"
}

variable "secrets_manager_enabled" {
  type        = bool
  default     = true
  description = "If `true`, secrets manages resource is enabled"
}

variable "secrets_manager_name" {
  type        = string
  default     = ""
  description = "The name of the secrets manager."
}