# Authentication for app

First you need to create a app on pocket dev api
We will receive the consumer key that we need to use in the following call
`curl -d "consumer_key=XXXXXXXXXX&redirect_uri=value2" -X POST https://getpocket.com/v3/oauth/request`
You will get the request_token under the variable name "code"
https://getpocket.com/auth/authorize?request_token=YOUR_REQUEST_TOKEN&redirect_uri=YOUR_REDIRECT_URI
`curl -d "consumer_key=XXXXXXXXX&code=XXXXXXXXXXXXXX" -X POST https://getpocket.com/v3/oauth/authorize 
