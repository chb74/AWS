#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 14, 2018 -- #

source Libs

set Key = 'Stack'
set Value = 'Production'

# -- Create tags for multiple instances -- # 
foreach inst ( `aws ec2 describe-instances --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].InstanceId'` )
    echo InstanceId : $inst
    aws ec2 create-tags --resources $inst --tags Key=$Key,Value=$Value
end
