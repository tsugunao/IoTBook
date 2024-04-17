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
│   ├── getDynamoDBStatus.py     //DynamoDBの値を取得するプログラムサンプル  
│   └── sendCommand.py           //MQTTのコマンドを送信するサンプル  
├── frontend
│   └── index.html            //Led制御のためのフロントエンドサンプル  
└── predictive_maintenance
    ├── lambda
    │   └── kfs-json2csv.py //Kinesis Firehoseでjson形式で受け取ったデータをcsvに変換するLambda関数サンプル
    └── notebook
        └── section6_nasa-bearing.ipynb //ベアリング異常検知モデルを作成するノートブックサンプル
```