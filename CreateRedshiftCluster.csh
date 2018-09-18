#!/bin/csh 

# -- By liverpools@gmail.com -- # 
# -- On Mar 26, 2018 -- # 

source Libs 

set Class = 'dc1.large'
set Nodes = 2
set User = 'admin'
set Pass = 'AdminXXXXXX'
set ClusterId = 'mzcluster'

aws redshift create-cluster --node-type $Class --number-of-nodes $Nodes \
    --master-username $User --master-user-password $Pass --cluster-identifier $ClusterId
