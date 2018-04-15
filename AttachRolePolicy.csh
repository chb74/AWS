#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 15, 2018 -- #

source Libs 

set PolicyArn = 'aa'
set RoleName = 'MzRole'

aws iam attach-role-policy --policy-arn $PolicyArn --role-name $RoleName --profile $Profile --region $Region
