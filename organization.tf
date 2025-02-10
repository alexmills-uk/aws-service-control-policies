data "aws_organizations_organizational_units" "all" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}