# AWS Infrastructure Design

## 1. Project Overview

This project provisions AWS infrastructure using Terraform
(Infrastructure as Code).

## 2. AWS Region

- Region: us-east-1
- Availability Zone: us-east-1a

## 3. Network Design

| Resource | Configuration |
|---|---|
| VPC CIDR | 10.0.0.0/16 |
| Public Subnet CIDR | 10.0.1.0/24 |
| Availability Zone | us-east-1a |
| Internet Gateway | 1 |
| Route Table | 1 |

## 4. Compute Design

| Resource | Configuration |
|---|---|
| Instance Type | t3.micro |
| Operating System | Ubuntu Server 22.04 LTS |
| Network | Public Subnet |

## 5. Security Design

- Use a dedicated Security Group.
- Apply least-privilege inbound rules.
- Avoid exposing unnecessary ports.
- Do not hardcode AWS credentials.

## 6. Terraform Architecture

The infrastructure will be organized into reusable modules:

- Networking module
- Compute module

## 7. Cost and Resource Considerations

- Use small instance types for learning purposes.
- Avoid unnecessary AWS resources.
- Inspect resources before destroying infrastructure.
- Verify playground restrictions and applicable charges.

## 8. Implementation Status

Design document created.
AWS resource provisioning has not yet been performed.
