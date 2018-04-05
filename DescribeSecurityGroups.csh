#!/bin/tcsh

# -- By chb@mz.co.kr -- # 
# -- On Apr 5, 2018 -- # 

foreach inst (`cat instances`)
    set Sg = `aws ec2 describe-instances --filters Name=instance-id,Values=$inst --profile Prd --region ap-northeast-2 | jq -r '.Reservations[].Instances[].SecurityGroups[].GroupName'`
    echo $inst " => " $Sg
end
