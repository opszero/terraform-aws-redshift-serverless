<!-- BEGIN_TF_DOCS -->

# Pro Support

<a href="https://www.opszero.com"><img src="https://assets.opszero.com/images/opszero_11_29_2016.png" width="300px"/></a>

[opsZero provides support](https://www.opszero.com/devops) for our modules including:

- Email support
- Zoom Calls
- Implementation Guidance
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user_password"></a> [admin\_user\_password](#input\_admin\_user\_password) | The password of the administrator for the first database created in the namespace. | `string` | `""` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username of the administrator for the first database created in the namespace. | `string` | `""` | no |
| <a name="input_amount"></a> [amount](#input\_amount) | The limit amount. If time-based, this amount is in Redshift Processing Units (RPU) consumed per hour. If data-based, this amount is in terabytes (TB) of data transferred between Regions in cross-account sharing. The value must be a positive number. | `number` | `60` | no |
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | Policy that grants an entity permission to assume the role. | `any` | `null` | no |
| <a name="input_base_capacity"></a> [base\_capacity](#input\_base\_capacity) | The base data warehouse capacity of the workgroup in Redshift Processing Units (RPUs). | `number` | `28` | no |
| <a name="input_breach_action"></a> [breach\_action](#input\_breach\_action) | The action that Amazon Redshift Serverless takes when the limit is reached. Valid values are log, emit-metric, and deactivate. The default is log. | `string` | `"log"` | no |
| <a name="input_config_parameter"></a> [config\_parameter](#input\_config\_parameter) | An array of parameters to set for more control over a serverless database. | `list(any)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Determines whether to create Redshift cluster and resources (affects all resources) | `bool` | `true` | no |
| <a name="input_create_random_password"></a> [create\_random\_password](#input\_create\_random\_password) | Determines whether to create random password for cluster `master_password` | `bool` | `true` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the first database created in the namespace. | `string` | `""` | no |
| <a name="input_default_iam_role_arn"></a> [default\_iam\_role\_arn](#input\_default\_iam\_role\_arn) | The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the cluster was created | `string` | `null` | no |
| <a name="input_endpoint_enable"></a> [endpoint\_enable](#input\_endpoint\_enable) | If `true`,  VPC endpoint is enabled | `bool` | `true` | no |
| <a name="input_endpoint_name"></a> [endpoint\_name](#input\_endpoint\_name) | The Redshift-managed VPC endpoint name | `string` | `""` | no |
| <a name="input_enhanced_vpc_routing"></a> [enhanced\_vpc\_routing](#input\_enhanced\_vpc\_routing) | If `true`, enhanced VPC routing is enabled | `bool` | `null` | no |
| <a name="input_iam_role_enabled"></a> [iam\_role\_enabled](#input\_iam\_role\_enabled) | If `true`, iam role resource is enabled | `bool` | `true` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | The name of the iam role | `string` | `""` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | A list of IAM roles to associate with the namespace. | `list(any)` | `[]` | no |
| <a name="input_kms_alias"></a> [kms\_alias](#input\_kms\_alias) | The display name of the alias. The name must start with the word 'alias' followed by a forward slash (alias/) | `string` | `"alias/redshift-serverless"` | no |
| <a name="input_kms_enabled"></a> [kms\_enabled](#input\_kms\_enabled) | If `true`, kms key is enabled | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the Amazon Web Services Key Management Service key used to encrypt your data. | `string` | `""` | no |
| <a name="input_log_exports"></a> [log\_exports](#input\_log\_exports) | The types of logs the namespace can export. Available export types are userlog, connectionlog, and useractivitylog. | `list(string)` | `[]` | no |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | The name of the namespace. | `string` | `""` | no |
| <a name="input_period"></a> [period](#input\_period) | The time period that the amount applies to. A weekly period begins on Sunday. Valid values are daily, weekly, and monthly. The default is monthly. | `string` | `"monthly"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | If `true`, iam policy is enabled | `any` | `null` | no |
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | The ARN of the policy you want to apply. | `string` | `""` | no |
| <a name="input_policy_enabled"></a> [policy\_enabled](#input\_policy\_enabled) | Whether to Attach Iam policy with role. | `bool` | `true` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of the iam policy name. | `string` | `""` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | If true, the cluster can be accessed from a public network | `bool` | `false` | no |
| <a name="input_random_password_length"></a> [random\_password\_length](#input\_random\_password\_length) | Length of random password to create. Defaults to `16` | `number` | `16` | no |
| <a name="input_retention_period"></a> [retention\_period](#input\_retention\_period) | How long to retain the created snapshot. Default value is -1. | `string` | `"-1"` | no |
| <a name="input_secrets_manager_enabled"></a> [secrets\_manager\_enabled](#input\_secrets\_manager\_enabled) | If `true`, secrets manages resource is enabled | `bool` | `true` | no |
| <a name="input_secrets_manager_name"></a> [secrets\_manager\_name](#input\_secrets\_manager\_name) | The name of the secrets manager. | `string` | `""` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | An array of security group IDs to associate with the workgroup. | `list(any)` | `[]` | no |
| <a name="input_serverless_resource_policy"></a> [serverless\_resource\_policy](#input\_serverless\_resource\_policy) | If `true`, serverless resource policy is enabled | `any` | `null` | no |
| <a name="input_snapshot_enable"></a> [snapshot\_enable](#input\_snapshot\_enable) | If `true`, snapshot is enabled | `bool` | `false` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | The name of the snapshot. | `string` | `""` | no |
| <a name="input_snapshot_policy_enable"></a> [snapshot\_policy\_enable](#input\_snapshot\_policy\_enable) | If `true`, snapshot policy is enabled | `bool` | `false` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | An array of VPC subnet IDs to use in the subnet group | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_usage_type"></a> [usage\_type](#input\_usage\_type) | The type of Amazon Redshift Serverless usage to create a usage limit for. Valid values are serverless-compute or cross-region-datasharing. | `string` | `"serverless-compute"` | no |
| <a name="input_workgroup_name"></a> [workgroup\_name](#input\_workgroup\_name) | The name of the workgroup. | `string` | `""` | no |
## Resources

| Name | Type |
|------|------|
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_redshiftserverless_endpoint_access.endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshiftserverless_endpoint_access) | resource |
| [aws_redshiftserverless_namespace.namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshiftserverless_namespace) | resource |
| [aws_redshiftserverless_resource_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshiftserverless_resource_policy) | resource |
| [aws_redshiftserverless_snapshot.snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshiftserverless_snapshot) | resource |
| [aws_redshiftserverless_usage_limit.usage_limit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshiftserverless_usage_limit) | resource |
| [aws_redshiftserverless_workgroup.workgroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshiftserverless_workgroup) | resource |
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.secrets_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_password.master_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_access_arn"></a> [endpoint\_access\_arn](#output\_endpoint\_access\_arn) | Amazon Resource Name (ARN) of the Redshift Serverless Endpoint Access. |
| <a name="output_endpoint_access_name"></a> [endpoint\_access\_name](#output\_endpoint\_access\_name) | Amazon Resource Name (ARN) of the Redshift Serverless Endpoint Access. |
| <a name="output_limit_arn"></a> [limit\_arn](#output\_limit\_arn) | Amazon Resource Name (ARN) of the Redshift Serverless Usage Limit. |
| <a name="output_limit_id"></a> [limit\_id](#output\_limit\_id) | The Redshift Usage Limit id. |
| <a name="output_namespace_arn"></a> [namespace\_arn](#output\_namespace\_arn) | The Redshift Namespace ID. |
| <a name="output_namespace_id"></a> [namespace\_id](#output\_namespace\_id) | The Redshift Namespace ID. |
| <a name="output_namespace_name"></a> [namespace\_name](#output\_namespace\_name) | The Redshift Namespace Name. |
| <a name="output_snapshot_accounts_with_restore_access"></a> [snapshot\_accounts\_with\_restore\_access](#output\_snapshot\_accounts\_with\_restore\_access) | All of the Amazon Web Services accounts that have access to restore a snapshot to a namespace. |
| <a name="output_snapshot_admin_username"></a> [snapshot\_admin\_username](#output\_snapshot\_admin\_username) | The username of the database within a snapshot. |
| <a name="output_snapshot_arn"></a> [snapshot\_arn](#output\_snapshot\_arn) | The Amazon Resource Name (ARN) of the namespace the snapshot was created from. |
| <a name="output_snapshot_name"></a> [snapshot\_name](#output\_snapshot\_name) | The name of the snapshot. |
| <a name="output_snapshot_namespace_arn"></a> [snapshot\_namespace\_arn](#output\_snapshot\_namespace\_arn) | The Amazon Resource Name (ARN) of the namespace the snapshot was created from. |
| <a name="output_snapshot_owner_account"></a> [snapshot\_owner\_account](#output\_snapshot\_owner\_account) | The owner Amazon Web Services; account of the snapshot. |
| <a name="output_vpc_endpoint"></a> [vpc\_endpoint](#output\_vpc\_endpoint) | The VPC endpoint or the Redshift Serverless workgroup |
| <a name="output_workgroup_arn"></a> [workgroup\_arn](#output\_workgroup\_arn) | Amazon Resource Name (ARN) of the Redshift Serverless Workgroup. |
| <a name="output_workgroup_id"></a> [workgroup\_id](#output\_workgroup\_id) | The Redshift Workgroup ID. |
| <a name="output_workgroup_name"></a> [workgroup\_name](#output\_workgroup\_name) | The Redshift Workgroup Name. |
<!-- END_TF_DOCS -->