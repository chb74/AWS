#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 5, 2018 -- #

set Folders = `aws s3 ls --profile Prd s3://prd-bucket/DevOps/ | awk '{print $2}'`
set Targets = 's3://prd-bucket/DevOpsBackup/'
set Source  = 'README'

foreach f ( $Folders )
    echo $Source " => " $Targets$f$Source
    aws s3 cp $Source $Targets$f$Source --profile Prd
end
