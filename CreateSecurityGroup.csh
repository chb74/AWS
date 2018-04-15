#!/bin/tcsh

# -- By chb@mz.co.kr -- #
# -- On Feb 26, 2018 -- #

source Libs 

set VpcId = 'vpc-xxxxxxxx'
set Sgs = ( Dev-SG Dev-EG )

foreach Sg ( $Sgs )
    echo Creating .. $Sg
    set GroupId = `aws ec2 create-security-group --group-name $Sg --description $Sg --vpc-id $VpcId --profile $Profile --region $Region | jq '.GroupId' -r`
    aws ec2 create-tags --resources $GroupId --tags Key=Name,Value=$Sg --profile $Profile --region $Region 
end
