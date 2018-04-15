#!/bin/tcsh

# -- By chb@mz.co.kr -- # 
# -- On Mar 30, 2018 -- # 

source Libs 

set SecurityGroup = 'sg-xxxxxx'
set Log = `pwd`/'describe-ec2-summary.log'

foreach i ( `aws ec2 describe-instances --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].InstanceId'` )
    set SecurityGroups = `aws ec2 describe-instances --instance-id $i --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].SecurityGroups[].GroupId'`

    # -- Add a New Security Group --# 
    set NewSecurityGroups = "$SecurityGroups $SecurityGroup"

    # -- Update a Security Groups of Ec2 Instance -- # 
    echo $i " ["$NewSecurityGroups"]"
    aws ec2 modify-instance-attribute --instance-id $i --groups $NewSecurityGroups --profile $Profile --region $Region 
end
