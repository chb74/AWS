#!/bin/csh 

# -- By liverpools@gmail.com -- # 
# -- On Feb 21, 2018 -- # 

set Path = 'mydomain.com/' 
set CertificateName = 'mydomain.com'
set CrtKey = $Path'mydomain.com_crt.pem'
set PrivateKey = $Path'mydomain.com_key.pem'
set ChainKey = $Path'CHAINCA.pem'
set Profile = 'default'
set Region = 'ap-northeast-2'

# -- Uploads a server certificate entity for the AWS account -- # 
aws iam upload-server-certificate \
    --server-certificate-name $CertificateName \
    --certificate-body file://$CrtKey \
    --private-key file://$PrivateKey \
    --certificate-chain file://$ChainKey \
    --path /cloudfront/$CertificateName/  \
    --region $Region \
    --profile $Profile

# -- Lists the server certificates stored in IAM that have the specified path prefix -- # 
aws iam list-server-certificates --region $Region --profile $Profile 
