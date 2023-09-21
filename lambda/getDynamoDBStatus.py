from __future__ import print_function
import boto3
from boto3.dynamodb.conditions import Key
from boto3.dynamodb.conditions import Attr
import datetime
import json
import traceback
import os

#-----Dynamo Info change here------
TABLE_NAME = os.environ.get('TABLE_NAME', "default")
DDB_PRIMARY_KEY = "device_id"
#-----Dynamo Info change here------

dynamodb = boto3.resource('dynamodb')
table  = dynamodb.Table(TABLE_NAME)

#------------------------------------------------------------------------
def dynamoQuery(deviceid, key):
    print("dynamoQuery start")
    
    options = {
    'KeyConditionExpression': Key(DDB_PRIMARY_KEY).eq(deviceid)
    }
    res = table.query(**options)
    
    if res['Count'] != 0 and key in res['Items'][0]['payload']:
        ans = { key:res['Items'][0]['payload'][key]}
        return ans
    else:
        return ''

#------------------------------------------------------------------------
# call by Lambda here.
#  Event structure : API-Gateway Lambda proxy post
#------------------------------------------------------------------------
def lambda_handler(event, context):
    #Lambda Proxy response back template
    HttpRes = {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin" : "*"},
        "body": "",
        "isBase64Encoded": False
    }

    try:
        print("lambda_handler start")
        print(json.dumps(event))

        # get Parameters
        pathParameters = event.get('pathParameters')
        deviceid = pathParameters["deviceid"]
        queryParameters = event.get('queryStringParameters')
        key = queryParameters['item']


        resItemDict = { deviceid : ""}
        resItemDict[deviceid] = dynamoQuery(deviceid, key)

        HttpRes['body'] = json.dumps(resItemDict, default=str)

    except Exception as e:
        print(traceback.format_exc())
        HttpRes["statusCode"] = 500
        HttpRes["body"] = "Lambda error. check lambda log"

    print("response:{}".format(json.dumps(HttpRes)))
    return HttpRes