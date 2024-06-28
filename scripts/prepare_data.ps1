cd C:\Espressif

# download the file
wget https://www.mydrive.ch/shares/38536/3830184030e49fe74747669442f0f282/download/420938130-1629953152/screw.tar.gz -O screw.tar.gz

# extract 
tar -zxvf screw.tar.gz

#ディレクトリを作成
mkdir data
cd data
mkdir training_data
mkdir test_data1
mkdir test_data2
cd training_data
mkdir normal
mkdir anomaly

cd C:\Espressif

# トレーニング用良品データをコピー
cp screw/train/good/* data/training_data/normal/.

# manipulated_frontのデータの00番台をトレーニング不良品データにコピー
$folderFileList = (Get-ChildItem -File "screw\test\manipulated_front\00*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\training_data\anomaly\m_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

# scratch_headのデータの00番台をトレーニング不良品データにコピー
$folderFileList = (Get-ChildItem -File "screw\test\scratch_head\00*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\training_data\anomaly\sh_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

# scratch_neckのデータの00番台をトレーニング不良品データにコピー
$folderFileList = (Get-ChildItem -File "screw\test\scratch_neck\00*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\training_data\anomaly\sn_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

# thread_sideのデータの00番台をトレーニング不良品データにコピー
$folderFileList = (Get-ChildItem -File "screw\test\thread_side\00*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\training_data\anomaly\ts_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

# thread_topのデータの00番台をトレーニング不良品データにコピー
$folderFileList = (Get-ChildItem -File "screw\test\thread_top\00*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\training_data\anomaly\tt_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

#テストデータ1,2用良品データをコピー
cp screw/test/good/00* data/test_data1/.
cp screw/test/good/01* data/test_data1/.
cp screw/test/good/02* data/test_data2/.
cp screw/test/good/03* data/test_data2/.

#テストデータ1,2用不良品データをコピー
$folderFileList = (Get-ChildItem -File "screw\test\manipulated_front\01*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data1\m_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}
$folderFileList = (Get-ChildItem -File "screw\test\manipulated_front\02*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data2\m_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

$folderFileList = (Get-ChildItem -File "screw\test\scratch_head\01*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data1\sh_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}
$folderFileList = (Get-ChildItem -File "screw\test\scratch_head\02*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data2\sh_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

$folderFileList = (Get-ChildItem -File "screw\test\scratch_neck\01*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data1\sn_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}
$folderFileList = (Get-ChildItem -File "screw\test\scratch_neck\02*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data2\sn_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

$folderFileList = (Get-ChildItem -File "screw\test\thread_side\01*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data1\ts_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}
$folderFileList = (Get-ChildItem -File "screw\test\thread_side\02*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data2\ts_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

$folderFileList = (Get-ChildItem -File "screw\test\thread_top\01*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data1\tt_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}
$folderFileList = (Get-ChildItem -File "screw\test\thread_top\02*" )
foreach($item in $folderFileList)
{
	$FileName = Split-Path $item -Leaf
	$newTarget = "C:\Espressif\data\test_data2\tt_$FileName"
	Copy-Item -Path $item -Destination $newTarget
}

