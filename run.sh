#/bin/bash

# リポジトリのクローン&geobleuインストール
if [ ! -d "geobleu" ]; then git clone https://github.com/yahoojapan/geobleu; fi
cd geobleu
pip3 install .
cd ../

# AWSアカウントIDを付与
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION

# S3バケットをマウントするためのディレクトリを作成
mkdir -p $MOUNT_POINT

# S3バケットをマウント
# ここで AWS_S3_BUCKET と AWS_S3_MOUNT_POINT は環境変数としてdocker-compose.yml
# またはDocker run コマンドで設定する必要があります。
mount-s3 $AWS_S3_BUCKET $MOUNT_POINT

jupyter notebook --ip=0.0.0.0 --allow-root --no-browser --NotebookApp.token="kaggle" --notebook-dir=/kaggle
