#!/bin/tcsh

# -- By chb@mz.co.kr -- #
# -- On Feb 26, 2018 -- #

source Libs 
set CertiName = 'old.example.com'

aws iam list-server-certificates  --profile $Profile --region $Region | jq -r ".ServerCertificateMetadataList[].ServerCertificateName"
aws iam delete-server-certificate --server-certificate-name  $CertiName --profile $Profile --region $Region
