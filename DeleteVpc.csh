#!/bin/tcsh 

# -- By chb@mz.co.kr -- # 
# -- On Mar 09, 2018 -- # 

set VpcName = 'MzVpc'
set VpcId = `jq .Vpc.VpcId $VpcName.json -r`
set Profile = 'default'
set Region = 'ap-northeast-2'

echo Deleting ... VpcId : $VpcId 
aws ec2 delete-vpc --vpc-id $VpcId --region $Region --profile $Profile
