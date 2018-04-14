#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 14, 2018 -- #

set TopicName = 'MegazoneAlarm'
set Region = 'ap-northeast-2'
set Profile = 'default'
set Protocol = 'email'
set Subscribe = ( chb@mz.co.kr liverpools@gmail.com )

# -- Create a new Topic -- #
set TopicArn = `aws sns create-topic --name $TopicName  --profile $Profile --region $Region | jq -r '.TopicArn'`

# -- Create a new Subscribe -- #
foreach sub ( $Subscribe )
    set Subscription = `aws sns subscribe --topic-arn $TopicArn --protocol $Protocol --notification-endpoint $sub --profile $Profile --region $Region | jq '.SubscriptionArn'`
end
