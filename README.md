# IoTBook

## 書籍リンク
- [Amazon購入ページ](https://amzn.asia/d/7qiXLRF)
- [技術評論社の書籍ページ](https://gihyo.jp/book/2024/978-4-297-14518-7)


## ディレクトリ構成
書籍で使用するソースコードを格納しています。
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
    ├── prepare_data.ps1  //写真をコピーするためのPowerShellスクリプト
    └── prepare_data.sh　　//写真をコピーするためのシェルスクリプト

```

## 書籍内リンク
### 2章
- Freenove ESP32-WROVER CAMボード
https://www.amazon.co.jp/dp/B09BC5CNHM

> [!NOTE]
>2025/5/27日現在リンク切れになっております。
>以下のオフィシャルのリンクから購入が可能です。
> * https://github.com/Freenove/Freenove_ESP32_WROVER_Board
> * https://ja.aliexpress.com/item/1005004339923548.html
  

- Andruno IDE
https://www.arduino.cc/en/software

- Micropython
http://micropython.org/

- Getting Started with ESP-IDF
https://idf.espressif.com/

- espressif/esp-iot-aws
https://github.com/espressif/esp-aws-iot

### 3章
- aws/aws-iot-device-sdk-python-v2　AWS IoT Jobのサンプルプログラム
https://github.com/aws/aws-iot-device-sdk-python-v2/blob/main/samples/jobs.py

- AWS SAM CLIのインストール手順
https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/install-sam-cli.html

### 4章
- AWS Pricing Calculator
https://calculator.aws/#/

- Anacron-sec/esp32-DHT11
https://github.com/Anacron-mb/esp32-DHT11


### 5章
- NASA Bearing Dataset
https://www.nasa.gov/intelligent-systems-division/discovery-and-systems-health/pcoe/pcoe-data-set-repository/

- NASA Bearing Dataset（Kaggle)
https://www.kaggle.com/datasets/vinayak123tyagi/bearing-dataset

- AWSブログ “「もう悩まない！機械学習モデルのデプロイパターンと戦略」を解説する動画を公開しました！”
https://aws.amazon.com/jp/blogs/news/ml-enablement-series-dark05/

- Random Cut Forest (RCF) Algorithm
https://docs.aws.amazon.com/ja_jp/sagemaker/latest/dg/randomcutforest.html

- Robust Random Cut Forest Based Anomaly Detection On Streams
http://proceedings.mlr.press/v48/guha16.pdf

- Machine Learning Lens
https://docs.aws.amazon.com/wellarchitected/latest/machine-learning-lens/machine-learning-lens.html
