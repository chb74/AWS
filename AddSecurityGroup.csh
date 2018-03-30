#!/bin/tcsh

# -- By chb@mz.co.kr -- # 
# -- On Mar 30, 2018 -- # 

set Profile = 'default'
set Region = 'ap-northeast-2'
set ExcludeSecurityGroup = 'sg-876c8bed'
set Log = `pwd`/'describe-ec2-summary.log'

foreach i ( `aws ec2 describe-instances --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].InstanceId'` )
    set SecurityGroups = `aws ec2 describe-instances --instance-id $i --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].SecurityGroups[].GroupId'`

    # -- Add a New Security Group --# 
    set NewSecurityGroups = "$SecurityGroups $ExcludeSecurityGroup"

    # -- Update a Security Groups of Ec2 Instance -- # 
    echo $i " ["$NewSecurityGroups"]"
    aws ec2 modify-instance-attribute --instance-id $i --groups $NewSecurityGroups --profile $Profile --region $Region 
end
