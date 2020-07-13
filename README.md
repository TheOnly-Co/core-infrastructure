# Core-Infrastructure
  **Core security infrastructure built to support TheOnly-Co.** 

## CircleCi

[![CircleCI](https://circleci.com/gh/TheOnly-Co/core-infrastructure.svg?style=shield)](https://circleci.com/gh/TheOnly-Co/core-infrastructure)
 - Configure `config.yml` to allow asynchronous updates with github.
 - Staging commands to plan/apply jobs to the master branch.

## AWS
 - Elastic Kubernetes Service
    - Couple CICD with helm to deploy software
    - Set up EKS rbac with AWS roles and permissions
    - Logging and monitoring with elaticsearch     
 - Virtual Private Cloud
   - Setup VPC and subnets with terraform and created internet gateway
   - Running EC2 instances
 - EC2 Instances
   - Running on **t3.micro**
   - Attach Elastic IP to internet gateway
   - Specify `ingress` and `egress` rule and `CIDR` blocks
 - [AWS amazon linux 2](https://aws.amazon.com/amazon-linux-2/)
   - Working with ami

## Okta

 - Single sign-on with MFA authentication.
 - Created Adminstrators.
