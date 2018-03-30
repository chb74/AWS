#!/bin/tcsh

# -- By chb@mz.co.kr -- # 
# -- On Mar 30, 2018 -- #

set Profile = 'default'
set Region = 'ap-northeast-2'

# -- This is a additional security group -- #
set Groups = 'sg-xxxxxxx'

foreach inst ( `aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'`)
    set Sgs = `aws ec2 describe-instances --instance-id $inst| jq -r '.Reservations[].Instances[].SecurityGroups[].GroupId'`
    set LastSgs = "$Sgs $Groups"
    aws ec2 modify-instance-attribute --instance-id $inst --groups $LastSgs --profile $Profile --region $Region
end 
