import requests
from datetime import datetime, timedelta
import os
import boto3
import json
def lambda_handler(event, context):
    consumer_key = os.environ['CONSUMER_KEY']
    access_token_key = os.environ['ACCESS_TOKEN_KEY']
    yesterday = datetime.now() - timedelta(days=1)
    r = requests.get('https://getpocket.com/v3/get?consumer_key={consumer_key}&access_token={access_token_key}&state=archive&favorite=1&since={yesterday}'
            .format(consumer_key=consumer_key,access_token_key=access_token_key,yesterday=yesterday))
    result = r.json()
    links = list()
    if result['status'] == 1:
        for _, item in result["list"].items():
            hashtags = ''
            if item['tags']:
                hastags += ','.join(['#'+tag for tag in item['tags']]) + ' '
            links.append(hashtags+item['tags']item['resolved_url'])
    print(links)
    if links:
        client = boto3.client('lambda')
        response = client.invoke(FunctionName='post_tweet',InvocationType='Event', Payload=json.dumps({'messages':links}))
        print(response)
