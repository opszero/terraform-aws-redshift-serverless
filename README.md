<!-- BEGIN_TF_DOCS -->

## Providers

No providers.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Database name | `any` | n/a | yes |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | Database password | `any` | n/a | yes |
| <a name="input_database_password_ssm_key"></a> [database\_password\_ssm\_key](#input\_database\_password\_ssm\_key) | Password stored in AWS SSM | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Create a name | `any` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | dc2.large | `any` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group ids | `any` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet ids | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list` | `[]` | no |
## Resources

No resources.
## Outputs

No outputs.
<!-- END_TF_DOCS -->