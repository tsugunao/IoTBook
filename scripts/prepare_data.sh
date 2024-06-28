#!/bin/sh

# download the file
wget https://www.mydrive.ch/shares/38536/3830184030e49fe74747669442f0f282/download/420938130-1629953152/screw.tar.gz

#データを展開
tar -zxvf screw.tar.gz
#ディレクトリを作成
mkdir -p data/training_data/normal
mkdir -p data/training_data/anomaly
mkdir -p data/test_data1
mkdir -p data/test_data2

# トレーニング用良品データをコピー
cp screw/train/good/* data/training_data/normal/.
# manipulated_frontのデータの00番台をトレーニング不良品データにコピー
for f in screw/test/manipulated_front/00*; do cp -- "$f" data/training_data/anomaly/m_$(basename "$f"); done
# scratch_headのデータの00番台をトレーニング不良品データにコピー
for f in screw/test/scratch_head/00*; do cp -- "$f" data/training_data/anomaly/sh_$(basename "$f"); done
# scratch_neckのデータの00番台をトレーニング不良品データにコピー
for f in screw/test/scratch_neck/00*; do cp -- "$f" data/training_data/anomaly/sn_$(basename "$f"); done
# thread_sideのデータの00番台をトレーニング不良品データにコピー
for f in screw/test/thread_side/00*; do cp -- "$f" data/training_data/anomaly/ts_$(basename "$f"); done
# thread_topのデータの00番台をトレーニング不良品データにコピー
for f in screw/test/thread_top/00*; do cp -- "$f" data/training_data/anomaly/tt_$(basename "$f"); done

#テストデータ1,2用良品データをコピー
cp screw/test/good/00* data/test_data1/.
cp screw/test/good/01* data/test_data1/.
cp screw/test/good/02* data/test_data2/.
cp screw/test/good/03* data/test_data2/.

#テストデータ1,2用不良品データをコピー
for f in screw/test/manipulated_front/01*; do cp -- "$f" data/test_data1/m_$(basename "$f"); done
for f in screw/test/manipulated_front/02*; do cp -- "$f" data/test_data2/m_$(basename "$f"); done

for f in screw/test/scratch_head/01*; do cp -- "$f" data/test_data1/sh_$(basename "$f"); done
for f in screw/test/scratch_head/02*; do cp -- "$f" data/test_data2/sh_$(basename "$f"); done

for f in screw/test/scratch_neck/01*; do cp -- "$f" data/test_data1/sn_$(basename "$f"); done
for f in screw/test/scratch_neck/02*; do cp -- "$f" data/test_data2/sn_$(basename "$f"); done

for f in screw/test/thread_side/01*; do cp -- "$f" data/test_data1/ts_$(basename "$f"); done
for f in screw/test/thread_side/02*; do cp -- "$f" data/test_data2/ts_$(basename "$f"); done

for f in screw/test/thread_top/01*; do cp -- "$f" data/test_data1/tt_$(basename "$f"); done
for f in screw/test/thread_top/02*; do cp -- "$f" data/test_data2/tt_$(basename "$f"); done


