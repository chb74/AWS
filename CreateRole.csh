#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 14, 2018 -- #

source Libs
set RoleName = 'MzRole'

aws iam create-role --role-name $RoleName  --assume-role-policy-document file://Trust-Policy.json --profile $Profile --region $Region
