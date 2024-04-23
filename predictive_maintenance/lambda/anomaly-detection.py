import json
import os
import io
import boto3
import statistics
import datetime as dt


def get_s3file(s3_session, bucket_name, key):
    s3obj = s3_session.Object(bucket_name, key).get()

    return io.TextIOWrapper(io.BytesIO(s3obj['Body'].read()))


def lambda_handler(event, context):
    bucket_name = os.environ['BUCKET_NAME']
    prefix_key = "{}/{}/{}/{}".format(os.environ['PREFIX_KEY'], event["PrevYear"], event["PrevMonth"],
                                      event["PrevDay"])
    threshold = float(os.environ['THRESHOLD'])

    s3_client = boto3.resource('s3')
    bucket = s3_client.Bucket(bucket_name)
    response = bucket.meta.client.list_objects_v2(Bucket=bucket.name, Prefix=prefix_key)

    list_anomalyscore = []
    message_template = {
        "normal": "ベアリングの状態は正常です。",
        "anomaly": "ベアリングの異常状態を検知しました。"
    }
    message = ""

    # 各ファイルでのデータ処理
    for obj in response['Contents']:
        if obj["Size"] != 0:
            prefixKey = obj["Key"]
            _list_records = []

            # データ処理
            # S3から推論結果データを読み込み、統計処理を加えて異常度スコアを取得
            for line in get_s3file(s3_client, bucket_name, prefixKey):
                _list_line = line.replace('\n', '').split(',')
                _list_records.append(_list_line)

            # numpyの配列に変換し、0列目のdatetimeの最小値、5列目の異常度スコアの中央値を計算
            datetime_list = [a[0] for a in _list_records]
            score_list = [a[5] for a in _list_records]
            datetime_min = min([dt.datetime.strptime(_datetime, '%Y-%m-%d %H:%M:%S.%f') for _datetime in datetime_list])
            anomaly_score_median = statistics.median([float(s) for s in score_list])

            if anomaly_score_median >= threshold:
                # 各ファイルごとの統計値を取得
                list_anomalyscore.append([datetime_min, anomaly_score_median])

    if len(list_anomalyscore) == 0:
        message = message_template["normal"]
    else:
        message = message_template["anomaly"]

    return {
        'message': message.encode('utf-8'),
        'data': json.loads(json.dumps(list_anomalyscore, default=str))
    }