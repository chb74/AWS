#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 15, 2018 -- #

set Region = 'ap-northeast-2'
set Profile = 'default'
set PolicyArn = 'aa'
set RoleName = 'MzRole'

aws iam attach-role-policy --policy-arn $PolicyArn --role-name $RoleName --profile $Profile --region $Region
