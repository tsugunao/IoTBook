import base64
import json

def lambda_handler(event, context):
    output = []

    for record in event['records']:
        payload = base64.b64decode(record['data']).decode('utf-8')

        csv_element = ','.join(map(lambda x: '"'+x+'"' if type(x) is str else str(x),list(json.loads(payload).values())))  + '\n'

        output_record = {
            'recordId': record['recordId'],
            'result': 'Ok',
            'data': base64.b64encode(csv_element.encode("utf-8"))
        }
        output.append(output_record)

    print('Successfully processed {} records.'.format(len(event['records'])))

    return {'records': output}
