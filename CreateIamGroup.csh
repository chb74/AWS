#!/bin/csh

# -- By liverpools@gmail.com -- #
# -- On Apr 15, 2018 -- #

source Libs

set GroupName = 'Admins'

aws iam create-group --group-name $GroupName --profile $Profile --region $Region
