#!/bin/tcsh 

# -- By chb@mz.co.kr -- # 
# -- On Feb 10, 2018 -- # 

source Libs 

set Vpcs = ( MzVpc 10.100.0.0/16 )
set Vpc = `aws ec2 create-vpc --cidr-block $Vpcs[2]`

if ( -e $Vpcs[1].json ) then 
	rm -f $Vpcs[1].json 
endif 

echo $Vpc > $Vpcs[1].json

set VpcId = `jq -r .Vpc.VpcId $Vpcs[1].json`

echo Creating Vpc : $VpcId 
aws ec2 create-tags --resources $VpcId --tags Key=Name,Value=$Vpcs[1] \
	--region $Region --profile $Profile 
