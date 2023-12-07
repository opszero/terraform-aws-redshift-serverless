provider "aws" {
  region  = "us-west-2"
  profile = "soulside"
}

data "aws_availability_zones" "available" {}

locals {
  name     = "soulside"
  region   = "us-west-2"
  vpc_cidr = "10.10.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  tags = {
    Name = local.name
  }
}

##-----------------------------------------------------------------------------
## vpc module call.
##-----------------------------------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name           = local.name
  cidr           = local.vpc_cidr
  azs            = local.azs
  public_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]

  tags = local.tags
}

##-----------------------------------------------------------------------------
## security group module call.
##-----------------------------------------------------------------------------
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/redshift"
  version = "~> 5.0"

  name        = local.name
  description = "Redshift Serverless security group"
  vpc_id      = module.vpc.vpc_id

  # Allow ingress rules to be accessed only within current VPC
  ingress_rules       = ["all-all"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  # Allow all rules for all protocols
  egress_rules = ["all-all"]

  tags = local.tags
}

##-----------------------------------------------------------------------------
## Data block to create IAM assume policy.
##-----------------------------------------------------------------------------
data "aws_iam_policy_document" "assume-policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "sagemaker.amazonaws.com",
        "redshift.amazonaws.com",
        "redshift-serverless.amazonaws.com"
      ]
    }
    actions = ["sts:AssumeRole"]
  }
}

##-----------------------------------------------------------------------------
## Data block to create IAM policy.
##-----------------------------------------------------------------------------
data "aws_iam_policy_document" "iam-policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetBucketAcl",
      "s3:GetBucketCors",
      "s3:GetEncryptionConfiguration",
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:ListAllMyBuckets",
      "s3:ListMultipartUploadParts",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
      "s3:PutBucketAcl",
      "s3:PutBucketCors",
      "s3:DeleteObject",
      "s3:AbortMultipartUpload",
      "s3:CreateBucket"
    ]
    effect    = "Allow"
    resources = ["arn:aws:s3:::*"]
  }
}


##-----------------------------------------------------------------------------
## redshift serverless module call.
##-----------------------------------------------------------------------------
module "redshift_serverless" {
  source = "./../"

  namespace_name = "${local.name}-ns"
  admin_username = "admin"
  db_name        = "test"

  log_exports = ["useractivitylog"]

  workgroup_name      = "${local.name}-workgroup"
  base_capacity       = 128
  publicly_accessible = false
  security_group_ids  = [module.security_group.security_group_id]
  subnet_ids          = module.vpc.public_subnets

  usage_type = "serverless-compute"
  amount     = 60

  ##endpoint name
  endpoint_enable = true
  endpoint_name   = "${local.name}-ep"

  ##snapshot
  snapshot_enable = false
  snapshot_name   = "${local.name}-snapshot"

  ##iam
  policy_enabled     = true
  iam_role_name      = "iam-${local.name}-redshift-serverless"
  assume_role_policy = data.aws_iam_policy_document.assume-policy.json
  policy             = data.aws_iam_policy_document.iam-policy.json
  ##secrets name
  secrets_manager_name = "${local.name}-password"

  tags = local.tags
}