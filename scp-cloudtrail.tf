resource "aws_organizations_policy" "cloudtrail" {
  name        = "scp_cloudtrail"
  description = "This SCP prevents users or roles in any affected account from disabling a CloudTrail log, either directly as a command or through the console."
  type        = "SERVICE_CONTROL_POLICY"
  content     = data.aws_iam_policy_document.cloudtrail_scp.json
}

data "aws_iam_policy_document" "cloudtrail_scp" {
  statement {
    actions   = ["cloudtrail:StopLogging", "cloudtrail:DeleteTrail"]
    resources = ["*"]
    effect    = "Deny"
  }
}

resource "aws_organizations_policy_attachment" "cloudtrail" {
  for_each = { for ou in data.aws_organizations_organizational_units.all.children : ou.id => ou }
  policy_id = aws_organizations_policy.cloudtrail.id
  target_id = each.value.id
}
