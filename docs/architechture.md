# Architecture

## Overview
This project implements a cloud-native High Availability pattern on AWS.

- **EKS**: runs the application workload
- **Single active pod** (replica=1) with Kubernetes rescheduling on failure
- **Service type LoadBalancer** provides a stable endpoint (logical VIP)
- **External Jenkins** performs synthetic monitoring every 5 minutes

## Key Ideas
- HA is achieved through infrastructure redundancy (3 nodes) and rescheduling.
- Endpoint stability is achieved via AWS Load Balancer.
- Monitoring is external to avoid dependency on the cluster under test.

## Components
- VPC (Public + Private + NAT)
- EKS cluster (private subnets)
- NodeGroup (3 nodes)
- Jenkins EC2 (private subnet, SSM recommended)
- Helm deployment (deployment + service + priorityclass)
