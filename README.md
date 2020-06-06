# Core-Infrastructure
  Core security infrastructure built to support TheOnly-Co. 

## CircleCi

[![CircleCI](https://circleci.com/gh/TheOnly-Co/core-infrastructure.svg?style=shield)](https://circleci.com/gh/TheOnly-Co/core-infrastructure)
 - Configure `config.yml` to allow asynchronous updates with github.
 - Staging commnads to plan/apply to master.

## AWS
  
 - Amazon Virtual Private Cloud
   - Setup VPC and subnets.
   - Create Internet Gateway.
 - AWS Instances
   - Running on **t3.micro.**
   - Attach Elastic IP to internet gateway.
   - Specify `ingress` and `egress` rule and `CIDR` blocks.
 - [AWS amazon linux 2](https://aws.amazon.com/amazon-linux-2/)
   - Working with ami.  

## Okta

 - Single sign-on with MFA authentication.
 - Created Adminstrators.
