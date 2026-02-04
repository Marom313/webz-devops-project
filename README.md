# webz-devops-project

Cloud-native High Availability architecture on AWS using EKS and external Jenkins monitoring.

## What this project demonstrates
- Production-style networking: **VPC + Public/Private subnets + NAT**
- Kubernetes platform: **EKS + 3-node nodegroup**
- Workload deployment: **Helm chart** with a **single active pod** (HA via rescheduling)
- Stable endpoint: **Service type LoadBalancer** (logical VIP)
- CI/CD & Monitoring: **Jenkins pipeline** + synthetic health checks + log archiving

## Repository structure
- `terraform/` - Infrastructure as Code (VPC, IAM, EKS, Jenkins)
- `app/` - Minimal web workload (Docker)
- `helm/` - Kubernetes deployment via Helm
- `jenkins/` - Jenkins pipeline + health check scripts
- `docs/` - Architecture docs and decisions

## Phases
- Phase 0: Repository bootstrap + first push
- Phase 1: Terraform IaC (VPC/IAM/EKS/Jenkins)
- Phase 2: Application + Docker image + registry target
- Phase 3: Helm deployment (deployment + service + priorityclass)
- Phase 4: CI/CD + monitoring + documentation

## Notes
This repo is designed to be production-quality in structure and patterns.
