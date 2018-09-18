#!/bin/csh

# -- By liverpools@gmail.com -- #
# -- On Feb 26, 2018 -- #

source Libs 

set LbArn = 'arn:aws:elasticloadbalancing:ap-northeast-2:111111111111:loadbalancer/app/myload/8f3dfd407df4d036'
set TgArn = 'arn:aws:elasticloadbalancing:ap-northeast-2:111111111111:targetgroup/my-targets/bf1d7f1f3d877adf'
set Protocol = 'HTTP'
set Port = 80

aws elbv2 create-listener \
                --load-balancer-arn $LbArn \
                --protocol $Protocol \
                --port $Port \
                --default-actions Type=forward,TargetGroupArn=$TgArn --profile $Profile --region $Region 
