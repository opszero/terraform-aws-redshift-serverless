resource "random_password" "master_password" {
  count            = var.create && var.admin_user_password == "" ? 1 : 0
  length           = var.random_password_length
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
  special          = false
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_iam_role" "role" {
  count              = var.create && var.iam_role_enabled ? 1 : 0
  name               = var.iam_role_name
  assume_role_policy = var.assume_role_policy
  tags               = var.tags
}

resource "aws_iam_role_policy" "policy" {
  count  = var.create && var.policy_enabled && var.iam_role_enabled && var.policy_arn == "" ? 1 : 0
  name   = var.policy_name == "" ? format("%s-policy", var.iam_role_name) : var.policy_name
  role   = aws_iam_role.role.*.id[0]
  policy = var.policy
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count      = var.create && var.policy_enabled && var.iam_role_enabled && var.policy_arn != "" ? 1 : 0
  role       = aws_iam_role.role.*.id[0]
  policy_arn = var.policy_arn
}

resource "aws_kms_key" "kms" {
  count                   = var.create && var.kms_enabled ? 1 : 0
  deletion_window_in_days = 10
  key_usage               = "ENCRYPT_DECRYPT"
}

resource "aws_kms_alias" "alias" {
  count         = var.create && var.kms_enabled ? 1 : 0
  name          = var.kms_alias
  target_key_id = join("", aws_kms_key.kms.*.key_id)
}

resource "aws_redshiftserverless_namespace" "namespace" {
  count                = var.create ? 1 : 0
  namespace_name       = var.namespace_name
  admin_username       = var.admin_username
  admin_user_password  = var.admin_user_password == "" ? join("", random_password.master_password.*.result) : var.admin_user_password
  db_name              = var.db_name
  default_iam_role_arn = var.iam_role_enabled ? join("", aws_iam_role.role.*.arn) : ""
  iam_roles            = var.iam_role_enabled ? [join("", aws_iam_role.role.*.arn)] : []
  kms_key_id           = var.kms_enabled == true ? join("", aws_kms_key.kms.*.arn) : var.kms_key_id
  log_exports          = var.log_exports
  tags                 = var.tags
}

resource "aws_redshiftserverless_workgroup" "workgroup" {
  count                = var.create ? 1 : 0
  namespace_name       = join("", aws_redshiftserverless_namespace.namespace.*.id)
  workgroup_name       = var.workgroup_name
  base_capacity        = var.base_capacity
  enhanced_vpc_routing = var.enhanced_vpc_routing
  publicly_accessible  = var.publicly_accessible
  security_group_ids   = var.security_group_ids
  subnet_ids           = var.subnet_ids
  tags                 = var.tags
  dynamic "config_parameter" {
    for_each = var.config_parameter != [] ? var.config_parameter : []
    content {
      parameter_key   = config_parameter.value.parameter_key
      parameter_value = config_parameter.value.parameter_value
    }
  }
}

resource "aws_redshiftserverless_usage_limit" "usage_limit" {
  count         = var.create ? 1 : 0
  resource_arn  = join("", aws_redshiftserverless_workgroup.workgroup.*.arn)
  usage_type    = var.usage_type
  amount        = var.amount
  breach_action = var.breach_action
  period        = var.period
}

resource "aws_redshiftserverless_endpoint_access" "endpoint" {
  depends_on             = [aws_redshiftserverless_workgroup.workgroup]
  count                  = var.create && var.endpoint_enable ? 1 : 0
  endpoint_name          = var.endpoint_name
  workgroup_name         = join("", aws_redshiftserverless_workgroup.workgroup.*.id)
  vpc_security_group_ids = var.security_group_ids
  subnet_ids             = var.subnet_ids
}

resource "aws_redshiftserverless_snapshot" "snapshot" {
  count            = var.create && var.snapshot_enable ? 1 : 0
  namespace_name   = join("", aws_redshiftserverless_workgroup.workgroup.*.namespace_name)
  snapshot_name    = var.snapshot_name
  retention_period = var.retention_period
}

resource "aws_redshiftserverless_resource_policy" "main" {
  count        = var.create && var.snapshot_policy_enable ? 1 : 0
  resource_arn = join("", aws_redshiftserverless_snapshot.snapshot.*.arn)
  policy       = var.serverless_resource_policy
}

resource "aws_secretsmanager_secret" "secret" {
  count = var.create && var.secrets_manager_enabled ? 1 : 0
  name  = var.secrets_manager_name
}

resource "aws_secretsmanager_secret_version" "secrets_version" {
  count         = var.create && var.secrets_manager_enabled ? 1 : 0
  secret_id     = join("", aws_secretsmanager_secret.secret.*.id)
  secret_string = <<EOF
   {
    "username": "${var.admin_username}",
    "password": "${var.admin_user_password == "" ? join("", random_password.master_password.*.result) : var.admin_user_password}"
   }
EOF
}