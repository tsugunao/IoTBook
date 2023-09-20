# IoTBook

書籍「AWS IoTで実現するデータ活用法(仮)」で使用するソースコードを格納しています。
本リポジトリのフォルダ構成は以下のようになっています。
```
.
├── eps32  
│   └── examples //ESP32のデバイスで動作するサンプルソフト  
│       ├── tls_mutual_auth  // esp-aws-iotと同じHello Worldのサンプル  
│       ├── mqtt_led         // MQTTにてLedを制御するサンプル  
│       ├── dht11            //センサデバイスdht11からデータを取得するサンプル  
│       └── mqtt_cam         //ESP32上のカメラから静止画をMQTTでアップするサンプル  
├── lambda  
│   ├── query_dynamodb.py     //DynamoDBの値を取得するプログラムサンプル  
│   └── send_mqtt_command.py  //MQTTのコマンドを送信するサンプル  
└── frontend  
    └── ndex.html            //Led制御のためのフロントエンドサンプル  

```