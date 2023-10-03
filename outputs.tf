output "namespace_name" {
  value       = join("", aws_redshiftserverless_namespace.namespace.*.id)
  description = "The Redshift Namespace Name."
}

output "namespace_id" {
  value       = join("", aws_redshiftserverless_namespace.namespace.*.namespace_id)
  description = "The Redshift Namespace ID."
}

output "namespace_arn" {
  value       = join("", aws_redshiftserverless_namespace.namespace.*.arn)
  description = "The Redshift Namespace ID."
}

output "workgroup_name" {
  value       = join("", aws_redshiftserverless_workgroup.workgroup.*.id)
  description = "The Redshift Workgroup Name."
}

output "workgroup_id" {
  value       = join("", aws_redshiftserverless_workgroup.workgroup.*.id)
  description = "The Redshift Workgroup ID."
}

output "workgroup_arn" {
  value       = join("", aws_redshiftserverless_workgroup.workgroup.*.arn)
  description = "Amazon Resource Name (ARN) of the Redshift Serverless Workgroup."
}

output "limit_id" {
  value       = join("", aws_redshiftserverless_usage_limit.usage_limit.*.id)
  description = "The Redshift Usage Limit id."
}

output "limit_arn" {
  value       = join("", aws_redshiftserverless_usage_limit.usage_limit.*.arn)
  description = "Amazon Resource Name (ARN) of the Redshift Serverless Usage Limit."
}

output "endpoint_access_arn" {
  value       = join("", aws_redshiftserverless_endpoint_access.endpoint.*.arn)
  description = "Amazon Resource Name (ARN) of the Redshift Serverless Endpoint Access."
}

output "endpoint_access_name" {
  value       = join("", aws_redshiftserverless_endpoint_access.endpoint.*.id)
  description = "Amazon Resource Name (ARN) of the Redshift Serverless Endpoint Access."
}

output "vpc_endpoint" {
  value       = aws_redshiftserverless_endpoint_access.endpoint.*.vpc_endpoint
  description = "The VPC endpoint or the Redshift Serverless workgroup"
}

output "snapshot_name" {
  value       = aws_redshiftserverless_snapshot.snapshot.*.id
  description = "The name of the snapshot."
}

output "snapshot_admin_username" {
  value       = aws_redshiftserverless_snapshot.snapshot.*.admin_username
  description = "The username of the database within a snapshot."
}

output "snapshot_namespace_arn" {
  value       = aws_redshiftserverless_snapshot.snapshot.*.namespace_arn
  description = "The Amazon Resource Name (ARN) of the namespace the snapshot was created from."
}

output "snapshot_arn" {
  value       = aws_redshiftserverless_snapshot.snapshot.*.arn
  description = "The Amazon Resource Name (ARN) of the namespace the snapshot was created from."
}

output "snapshot_accounts_with_restore_access" {
  value       = aws_redshiftserverless_snapshot.snapshot.*.accounts_with_restore_access
  description = "All of the Amazon Web Services accounts that have access to restore a snapshot to a namespace."
}

output "snapshot_owner_account" {
  value       = aws_redshiftserverless_snapshot.snapshot.*.owner_account
  description = "The owner Amazon Web Services; account of the snapshot."
}
