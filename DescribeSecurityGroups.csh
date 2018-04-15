#!/bin/tcsh

# -- By chb@mz.co.kr -- #
# -- On Apr 15, 2018 -- #

source Libs

foreach inst (`aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'`)
        set Sg = `aws ec2 describe-instances --filters Name=instance-id,Values=$inst --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].SecurityGroups[].GroupName'`
        echo $inst " => " $Sg
end
