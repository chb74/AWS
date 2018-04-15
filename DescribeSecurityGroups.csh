#!/bin/tcsh

# --
# --

source Libs

foreach inst (`aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'`)
        set Sg = `aws ec2 describe-instances --filters Name=instance-id,Values=$inst --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].SecurityGroups[].GroupName'`
        echo $inst " => " $Sg
end
