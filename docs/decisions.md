# Architecture Decisions

## Public + Private + NAT
Chosen to follow production network isolation practices.
- Public: IGW, Load Balancer, NAT
- Private: EKS nodes, Jenkins

## Single Active Pod
Mimics legacy Active/Standby HA while still being cloud-native.
Replica=1, rescheduling on failure.

## External Jenkins Monitoring
Monitoring must remain available even if the cluster is unhealthy.
