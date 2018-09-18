#!/bin/csh

# -- By liverpools@gmail.com -- #
# -- On Apr 14, 2018 -- #

source Libs
set RoleName = 'MzRole'

aws iam create-role --role-name $RoleName  --assume-role-policy-document file://Trust-Policy.json --profile $Profile --region $Region
