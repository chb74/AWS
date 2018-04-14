#!/bin/csh 

# -- By chb@mz.co.kr -- # 
# -- On Apr 14, 2018 -- # 

set Count = `ps -ef   | grep httpd | grep -v grep | wc -l`
aws cloudwatch put-metric-data --metric-name ApacheProcess --namespace "AWS/EC2" --value $Count 

# -- You can see on CloutWatch Metrics (AWS/EC2 Namespace) -- # 
# -- At cron, you can modify like this * * * * * /root/PutMetric.csh 2>&1 > /dev/null -- # 
