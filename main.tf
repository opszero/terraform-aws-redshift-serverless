locals {
  tags = merge(var.tags, {
    Name = var.name
  })
}

module "database_password" {
  source = "github.com/opszero/terraform-aws-ssm"
  secret = var.database_password_ssm_key
}

module "redshift" {
  source  = "terraform-aws-modules/redshift/aws"
  version = "4.0.1"

  cluster_identifier    = var.name
  allow_version_upgrade = true
  node_type             = var.node_type
  number_of_nodes       = 1

  database_name          = var.database_name
  master_username        = var.database_username
  master_password        = module.database_password.secret_value
  create_random_password = false

  encrypted                            = true
  enhanced_vpc_routing                 = true
  vpc_security_group_ids               = var.security_group_ids
  subnet_ids                           = var.subnet_ids
  availability_zone_relocation_enabled = true

  logging = {
    enable = false
  }

  # Parameter group
  # parameter_group_name        = "example-custom"
  # parameter_group_description = "Custom parameter group for example cluster"
  # parameter_group_parameters = {
  #   wlm_json_configuration = {
  #     name = "wlm_json_configuration"
  #     value = jsonencode([
  #       {
  #         query_concurrency = 15
  #       }
  #     ])
  #   }
  #   require_ssl = {
  #     name  = "require_ssl"
  #     value = true
  #   }
  #   use_fips_ssl = {
  #     name  = "use_fips_ssl"
  #     value = false
  #   }
  #   enable_user_activity_logging = {
  #     name  = "enable_user_activity_logging"
  #     value = true
  #   }
  #   max_concurrency_scaling_clusters = {
  #     name  = "max_concurrency_scaling_clusters"
  #     value = 3
  #   }
  #   enable_case_sensitive_identifier = {
  #     name  = "enable_case_sensitive_identifier"
  #     value = true
  #   }
  # }
  # parameter_group_tags = {
  #   Additional = "CustomParameterGroup"
  # }

  # Subnet group
  subnet_group_name        = var.name
  subnet_group_description = ""
  subnet_group_tags        = local.tags

  # Snapshot schedule
  # create_snapshot_schedule        = true
  # snapshot_schedule_identifier    = local.name
  # use_snapshot_identifier_prefix  = true
  # snapshot_schedule_description   = "Example snapshot schedule"
  # snapshot_schedule_definitions   = ["rate(12 hours)"]
  # snapshot_schedule_force_destroy = true

  # Usage limits
  # usage_limits = {
  #   currency_scaling = {
  #     feature_type  = "concurrency-scaling"
  #     limit_type    = "time"
  #     amount        = 60
  #     breach_action = "emit-metric"
  #   }
  #   spectrum = {
  #     feature_type  = "spectrum"
  #     limit_type    = "data-scanned"
  #     amount        = 2
  #     breach_action = "disable"
  #     tags = {
  #       Additional = "CustomUsageLimits"
  #     }
  #   }
  # }

  tags = local.tags
}
