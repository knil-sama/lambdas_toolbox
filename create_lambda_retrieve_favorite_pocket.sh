pip3 install -t retrieve_favorite_pocket requests 
cd retrieve_favorite_pocket;
zip -r ../retrieve_favorite_pocket.zip ./*
cd ..
# create-function don't allow to override so we have to delete it first
aws lambda delete-function --function-name retrieve_favorite_pocket
aws lambda create-function \
    --region eu-west-3 \
    --function-name retrieve_favorite_pocket \
    --zip-file fileb://./retrieve_favorite_pocket.zip \
    --role  arn:aws:iam::XXXXXXX:role/service-role/XXXXXXXXX \
    --environment Variables="{ACCESS_TOKEN_KEY=XXXXXXXXXXXXXX,
                              CONSUMER_KEY=XXXXXXXXXXXXXXX
                             }" \
    --handler retrieve_favorite_pocket.lambda_handler \
    --runtime python3.6 \
    --profile default
