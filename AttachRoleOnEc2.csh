#!/bin/csh 

# -- By liverpools@gmail.com -- # 
# -- On Mar 01, 2018 -- # 

source Libs 

set RoleName = 'Ec2Role' 
set Insts = ( `aws ec2 describe-instances --region $Region --profile $Profile  | jq -r '.Reservations[].Instances[].InstanceId'`)

foreach i ( $Insts )
	echo $i
	aws ec2 associate-iam-instance-profile --instance-id $i --iam-instance-profile Name=$RoleName  --region $Region --profile $Profile
end
