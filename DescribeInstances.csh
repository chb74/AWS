#!/bin/tcsh

# -- By chb@mz.co.kr -- #
# -- On Mar 02, 2018 -- #

set Profile = 'default'
set Region = 'ap-northeast-2'

#aws ec2 describe-instances --profile $Profile --region $Region | \
# jq 'if .Reservations[].Instances[].Tags[].Key == "Name" then \
#   { Name : .Reservations[].Instances[].Tags[].Value } else empty end'
aws ec2 describe-instances --profile $Profile --region $Region | \
 jq ' .Reservations[].Instances[] | { InstanceId : .InstanceId, \
  PrivateIp : .NetworkInterfaces[].PrivateIpAddress, \
  PublicIp : .NetworkInterfaces[].PrivateIpAddresses[].Association.PublicIp}'
