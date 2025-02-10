# AWS Service Control Policies in Terraform

This solution helps you quickly deploy a set of useful AWS Service Control Policies (SCPs) using Terraform. These policies are intended to help manage your AWS organization by restricting access and defining permissions for AWS accounts and Organizational Units (OUs).

Service Control Policies (SCPs) are a powerful feature of AWS Organizations that allow you to set permissions guardrails for accounts and OUs within your organization, enabling better security and compliance controls across your AWS environment.

This repository provides a collection of predefined SCPs that can be easily applied to your AWS Organization using Terraform, ensuring that your cloud environment adheres to best practices in terms of security, governance, and compliance.

## Scope of the SCP Solution

The following details the effect remit of the AWS Service Control Policies solution:

- **Configuration of AWS Service Control Policies**: A set of predefined policies for AWS accounts and OUs.
- **Use of Terraform for Deployment**: Automatically deploy and manage SCPs across your AWS Organization using Terraform.
- **Apply Policies across Accounts and OUs**: Control what actions are allowed or denied at the AWS Organization level.
- **Security Best Practices**: Ensure that only permitted services and actions are available to AWS accounts in your organization.

## Initial Configuration

This solution requires a small amount of initial configuration to facilitate future automatic deployments of SCPs.

1. **Set Up AWS Organization**: You need an AWS Organization already in place. If you don’t have one, you can get [started with an example](https://github.com/alexmills-uk/aws-organisation)

2. **Enable Service Control Policies for your AWS Organization**: In the AWS Console, navigate to Organizations, click Policies in the left-hand menu, select Service Control Policies and finally, click Enable service control policies. Here, you can find some examples of Service Control Policies.

3. **Add this repository to the Trust Relationships for your github-deployment role**: Assuming you have [deployed an Organization from my example](https://github.com/alexmills-uk/aws-organisation), login to your Organization AWS account, go to IAM, and under Roles, search for `github-deployment`. Change the `token.actions.githubusercontent.com:sub` Condition block to include this repository (or wherever you have forked this repository), as follows:

```
                    "token.actions.githubusercontent.com:sub": [
                        "repo:alexmills-uk/aws-organisation:*",
                        "repo:alexmills-uk/aws-service-control-policies:*"
                    ]
```

4. **Define Variables in Terraform**: Set the following variables in your `terraform.tfvars` file:
    - `AWS_REGION`: The AWS region where you are managing your AWS Organization.
    - `AWS_ACCOUNT_ID`: The root AWS account ID under which your AWS Organization resides.

Once the configuration is complete, you can run the Terraform deployment to apply the Service Control Policies (SCPs) to your AWS Organization.