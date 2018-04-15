#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 5, 2018 -- #

source Libs 

set Folders = `aws s3 ls --profile Prd s3://prd-bookclub-codedeploy/Developer/ --profile $Profile --region $Region | awk '{print $2}'`
set Targets = 's3://prd-source-group/DevOps/'
set Source  = 'README'

foreach f ( $Folders )
        echo $Source " => " $Targets$f$Source
        aws s3 cp $Source $Targets$f$Source --profile $Profile --region $Region 
end
