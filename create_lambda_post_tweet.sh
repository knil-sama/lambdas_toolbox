# package need to be installed using following command
sudo pip3 install twython -t ./post_tweet
cd post_tweet;
zip -r ../post_tweet.zip ./*
cd ..
# create-function don't allow to override so we have to delete it first
aws lambda delete-function --function-name post_tweet
aws lambda create-function \
    --region eu-west-3 \
    --function-name post_tweet \
    --zip-file fileb://./post_tweet.zip \
    --role  arn:aws:iam:XXXXXXX:role/service-role/XXXXXXXXX \
    --environment Variables="{CONSUMER_KEY=XXXXXXXXXXXX,
			      CONSUMER_SECRET=XXXXXXXXXXXXXXXXX,
          	              ACCESS_TOKEN_KEY=XXXXXXXXXX,
                              ACCESS_TOKEN_SECRET=XXXXXXXXXX
                             }" \
    --handler post_tweet.lambda_handler \
    --runtime python3.6 \
    --profile default
