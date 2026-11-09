# IP Address Plan

## 1. Network Overview

AWS Region: us-east-1

VPC CIDR: 10.0.0.0/16

## 2. IP Allocation

| Resource | CIDR | Purpose |
|---|---|---|
| VPC | 10.0.0.0/16 | Main AWS network |
| Public Subnet | 10.0.1.0/24 | Public-facing EC2 |
| Reserved Subnet | 10.0.2.0/24 | Future expansion |

## 3. Subnet Details

- Availability Zone: us-east-1a
- Subnet Type: Public
- Auto Assign Public IP: Enabled
- Internet Access: Through Internet Gateway

## 4. AWS Reserved IP Addresses

AWS reserves five IPv4 addresses in every subnet.

For a /24 subnet:
- Total IP addresses: 256
- Reserved IP addresses: 5
- Usable IP addresses: 251

## 5. Network Design Considerations

- Avoid overlapping CIDR blocks.
- Keep subnet allocations organized.
- Reserve address space for future expansion.
- Separate public and private workloads when required.
