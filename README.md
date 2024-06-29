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
├── predictive_maintenance
│    ├── lambda
│    ├── anomaly-detection.py //異常検知判定ロジックを実装したLambda関数サンプル
│    │   ├── get-exec-datetime.py //実行日時を出力するLambda関数サンプル
│    │   └── kfs-json2csv.py //Kinesis Firehoseでjson形式で受け取ったデータをcsvに変換するLambda関数サンプル
│    ├── notebook
│    │    ├── section6-data-processing.ipynb //NASA Bearing Datasetを推論用データに加工するノートブックサンプル
│    │   └── section6_nasa-bearing.ipynb //ベアリング異常検知モデルを作成するノートブックサンプル
│    └── sfn
│        └── anomaly-detection.asl.json //予兆検知システムのStepFunctionsのステートマシーンサンプルjson定義ファイル
└── scripts
    ├── prepare_data.ps1  //5章で使用する写真をコピーするためのPowerShellスクリプト
    └── prepare_data.sh　　//5章で使用する写真をコピーするためのシェルスクリプト

```