#!/bin/tcsh 

# -- By chb@mz.co.kr -- # 
# -- On Mar 28, 2018 -- # 

# -- When key is given an array, it returns the valid indices for that array. --#
aws ec2 describe-instances | jq 'keys'  
aws ec2 describe-instances | jq ' .Reservations[].Instances[] | keys' 

echo [1, 2, 1, 4, 5] | jq 'unique' 
echo [1, 2, 1, 4, 5] | jq 'reverse'
