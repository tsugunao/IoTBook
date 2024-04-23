import json
import datetime as dt
from zoneinfo import ZoneInfo

def lambda_handler(event, context):
    # 現日時の取得
    now = dt.datetime.now(ZoneInfo('Asia/Tokyo'))

    # 前日の取得
    prev_datetime = (now - dt.timedelta(days=1))

    return {
        "StartYear": str(now.year),
        "StartMonth": str(now.month),
        "StartDay": str(now.day),
        "StartDate": now.date().strftime('%Y-%m-%d'),
        "StartHour": str(now.hour),
        "StartMinute": str(now.minute),
        "PrevYear": str(prev_datetime.year),
        "PrevMonth": str(prev_datetime.month),
        "PrevDay": str(prev_datetime.day)
    }