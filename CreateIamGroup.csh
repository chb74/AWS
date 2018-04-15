#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 15, 2018 -- #

source Libs

set GroupName = 'Admins'

aws iam create-group --group-name $GroupName --profile $Profile --region $Region
