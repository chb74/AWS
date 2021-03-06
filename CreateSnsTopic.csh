#!/bin/csh

# -- By chb@mz.co.kr -- #
# -- On Apr 14, 2018 -- #

source Libs 

set TopicName = 'Alarm'
set Protocol = 'email'
set Subscribe = ( mail@mail.com mail2@mail.com  )

# -- Get Topic List -- #
aws sns list-topics --profile $Profile --region $Region | jq -r '.Topics[].TopicArn'

# -- Create a new Topic -- #
set TopicArn = `aws sns create-topic --name $TopicName  --profile $Profile --region $Region | jq -r '.TopicArn'`

# -- Create a new Subscribe -- #
foreach sub ( $Subscribe )
    set Subscription = `aws sns subscribe --topic-arn $TopicArn --protocol $Protocol \
        --notification-endpoint $sub --profile $Profile --region $Region | jq '.SubscriptionArn'`
end
