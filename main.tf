module "redshift" {
  source  = "terraform-aws-modules/redshift/aws"

  cluster_identifier    = "example"
  allow_version_upgrade = true
  node_type             = "ra3.xlplus"
  number_of_nodes       = 3

  database_name          = "mydb"
  master_username        = "mydbuser"
  create_random_password = false
  master_password        = "MySecretPassw0rd1!" # Do better!

  encrypted   = true
  kms_key_arn = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"

  enhanced_vpc_routing   = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_ids             = ["subnet-123456", "subnet-654321"]

  availability_zone_relocation_enabled = true

  snapshot_copy = {
    useast1 = {
      destination_region = "us-east-1"
      grant_name         = "example-grant"
    }
  }

  logging = {
    enable        = true
    bucket_name   = "my-s3-log-bucket"
    s3_key_prefix = "example/"
  }

  # Parameter group
  parameter_group_name        = "example-custom"
  parameter_group_description = "Custom parameter group for example cluster"
  parameter_group_parameters = {
    wlm_json_configuration = {
      name = "wlm_json_configuration"
      value = jsonencode([
        {
          query_concurrency = 15
        }
      ])
    }
    require_ssl = {
      name  = "require_ssl"
      value = true
    }
    use_fips_ssl = {
      name  = "use_fips_ssl"
      value = false
    }
    enable_user_activity_logging = {
      name  = "enable_user_activity_logging"
      value = true
    }
    max_concurrency_scaling_clusters = {
      name  = "max_concurrency_scaling_clusters"
      value = 3
    }
    enable_case_sensitive_identifier = {
      name  = "enable_case_sensitive_identifier"
      value = true
    }
  }
  parameter_group_tags = {
    Additional = "CustomParameterGroup"
  }

  # Subnet group
  subnet_group_name        = "example-custom"
  subnet_group_description = "Custom subnet group for example cluster"
  subnet_group_tags = {
    Additional = "CustomSubnetGroup"
  }

  # Snapshot schedule
  create_snapshot_schedule        = true
  snapshot_schedule_identifier    = local.name
  use_snapshot_identifier_prefix  = true
  snapshot_schedule_description   = "Example snapshot schedule"
  snapshot_schedule_definitions   = ["rate(12 hours)"]
  snapshot_schedule_force_destroy = true

  # Scheduled actions
  create_scheduled_action_iam_role = true
  scheduled_actions = {
    pause = {
      name          = "example-pause"
      description   = "Pause cluster every night"
      schedule      = "cron(0 22 * * ? *)"
      pause_cluster = true
    }
    resize = {
      name        = "example-resize"
      description = "Resize cluster (demo only)"
      schedule    = "cron(00 13 * * ? *)"
      resize_cluster = {
        node_type       = "ds2.xlarge"
        number_of_nodes = 5
      }
    }
    resume = {
      name           = "example-resume"
      description    = "Resume cluster every morning"
      schedule       = "cron(0 12 * * ? *)"
      resume_cluster = true
    }
  }

  # Endpoint access
  create_endpoint_access          = true
  endpoint_name                   = "example-example"
  endpoint_subnet_group_name      = "example-subnet-group"
  endpoint_vpc_security_group_ids = ["sg-12345678"]

  # Usage limits
  usage_limits = {
    currency_scaling = {
      feature_type  = "concurrency-scaling"
      limit_type    = "time"
      amount        = 60
      breach_action = "emit-metric"
    }
    spectrum = {
      feature_type  = "spectrum"
      limit_type    = "data-scanned"
      amount        = 2
      breach_action = "disable"
      tags = {
        Additional = "CustomUsageLimits"
      }
    }
  }

  # Authentication profile
  authentication_profiles = {
    example = {
      name = "example"
      content = {
        AllowDBUserOverride = "1"
        Client_ID           = "ExampleClientID"
        App_ID              = "example"
      }
    }
    bar = {
      content = {
        AllowDBUserOverride = "1"
        Client_ID           = "ExampleClientID"
        App_ID              = "bar"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}