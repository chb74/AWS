#!/bin/tcsh

# -- By chb@mz.co.kr -- #
# -- On Feb 26, 2018 -- #

source Libs 

set GroupName = 'MySecurityGroup'
set VpcId = 'vpc-xxxxxx'

aws ec2 describe-security-groups \
# -- filters Name=vpc-id,Values=$VpcId \
                --group-names $GroupName \
                --profile $Profile  \
                --region $Region 
