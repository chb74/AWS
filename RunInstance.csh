#!/bin/tcsh 

# -- By liverpools@gmail.com -- # 
# -- On Jan 2, 2018 -- # 

source Libs 

set SG = 'sg-xxxxxx'
set SN = 'subnet-xxxxxx'
set AmiId = 'ami-xxxxx'
set Count = 1 
set Class = 't2.medium'
set Key = 'xxxxxx'
set UserData = 'UserData.txt'

# -- Run a Instance -- # 
aws ec2 run-instances \
    --image-id $AmiId \
    --count $Count \
    --instance-type $Class \
    --key-name $Key \
    --security-group-ids $SG \
    --subnet-id $SN \
    --associate-public-ip-address \
    --user-data file://$UserData \
    --region $Region \
    --profile $Profile 
