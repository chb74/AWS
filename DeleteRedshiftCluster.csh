#!/bin/tcsh 

# -- By chb@mz.co.kr -- # 
# -- On Mar 26, 2018 -- # 

source Libs 

set Class = 'dc1.large'
set Nodes = 2
set User = 'admin'
set Pass = 'Admin3355'
set ClusterId = 'mzcluster'

aws redshift delete-cluster --cluster-identifier $ClusterId --skip-final-cluster-snapshot
