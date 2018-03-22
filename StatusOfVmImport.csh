#!/bin/tcsh 

set ImportId = 'import-ami-xxxxxxx'
set Profile = 'default'
set Region = 'ap-northeast-2'

aws ec2 describe-import-image-tasks --import-task-ids $ImportId --region $Region --profile $Profile 
