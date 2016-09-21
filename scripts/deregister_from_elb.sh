#!/bin/bash

export AWS_DEFAULT_REGION=eu-west-1

instanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

aws autoscaling update-auto-scaling-group --autoscaling_group_name Infra-LinuxWebASG-1CV8I05X041PS --health-check-type EC2

aws elb deregister-instances-from-load-balancer --load-balancer-name LinuxWebELB  --instances $instanceID

sleep 60
