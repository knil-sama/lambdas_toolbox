from twython import Twython
import os
twitter = Twython(os.environ['CONSUMER_KEY'], os.environ['CONSUMER_SECRET'],
                  os.environ['ACCESS_TOKEN_KEY'], os.environ['ACCESS_TOKEN_SECRET'])
def lambda_handler(event, context):
    messages = event['messages']
    if isinstance(messages,str):
        messages = [messages]
    for message in messages:
        twitter.update_status(status=message)
        print("published {}".format(message))
    return len(messages)
