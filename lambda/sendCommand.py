import json
import boto3

iot = boto3.client('iot-data')

def lambda_handler(event, context):

    print(event)
    command=event['body']
    pathParameters = event.get('pathParameters')
    deviceid = pathParameters["deviceid"]

    topic = 'cmd/led/meguro/20f/'+deviceid
    print("command:" + command + " topic:" + topic)

    try:
        iot.publish(
            topic=topic,
            qos=1,
            payload=command
        )
        return {
            'statusCode': '200',
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": '*'
            },
            'body': 'Succeeeded'
        }

    except Exception as e:
        print(e)
        return {
            'statusCode': '500',
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": '*'
            },
            'body': e
        }