#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 14, 2018 -- #

set Key = 'Stack'
set Value = 'Production'
set Region = 'ap-northeast-2'
set Profile = 'default'

# -- Create tags for multiple instances -- # 
foreach inst ( `aws ec2 describe-instances --profile $Profile --region $Region | jq -r '.Reservations[].Instances[].InstanceId'` )
    echo $inst
    aws ec2 create-tags --resources $inst --tags Key=$Key,Value=$Value
end
