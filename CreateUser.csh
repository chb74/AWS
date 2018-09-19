#!/bin/csh

# -- By liverpools@gmail.com -- #
# -- On Apr 15, 2018 -- #

# -- Load the Libs -- #
source Libs

set User = 'Bob'

aws iam create-user --user-name $User --profile $Profile --region $Region
