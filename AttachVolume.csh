#!/bin/csh 

# -- By liverpools@gmail.com -- # 
# -- On Mar 08, 2018 -- # 

source Libs 

set Zone = 'a' 
set Size = 30
set VolumeType = 'gp2'
set Device = '/dev/xvdf'
set InstanceId = 'i-xxxxxxxxx'

set VolumeId = `aws ec2 create-volume --availability-zone $Region$Zone --size $Size \
  --volume-type $VolumeType --region $Region --profile $Profile  | jq -r '.VolumeId'` 

sleep 5
set AttachVolume = `aws ec2 attach-volume --device $Device --instance-id $InstanceId \
  --volume-id $VolumeId --region $Region --profile $Profile`

echo $AttachVolume
