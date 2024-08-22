#/bin/bash

# S3バケットをマウントするためのディレクトリを作成
mkdir -p $MOUNT_POINT

# S3バケットをマウント
# ここで AWS_S3_BUCKET と AWS_S3_MOUNT_POINT は環境変数としてdocker-compose.yml
# またはDocker run コマンドで設定する必要があります。
mount-s3 $AWS_S3_BUCKET $MOUNT_POINT

jupyter notebook --ip=0.0.0.0 --allow-root --no-browser --NotebookApp.token="kaggle" --notebook-dir=/kaggle
