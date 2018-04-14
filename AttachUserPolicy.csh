#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 15, 2018 -- #

# -- Load the Libs -- #
source Libs

set User = 'Bob'
set PolicyArn = 'arn:aws:iam::229741284146:policy/MzPolicy'

aws iam attach-user-policy --policy-arn $PolicyArn --user-name $User --profile $Profile --region $Region
