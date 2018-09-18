#!/bin/csh 

# -- By liverpools@gmail.com -- # 
# -- On Jan 24, 2018 -- # 

set Region = 'ap-northeast-2'
set Profile = 'default'
set Containers = 'containers.json'
set Desc = 'Amazon Linux'
set ImportId = `aws ec2 import-image --description $Desc --disk-containers file://$Containers --profile $Profile --region $Region | jq -r '.ImportTaskId' `

aws ec2 describe-import-image-tasks --import-task-ids $ImportId --profile $Profile --region $Region
