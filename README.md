# 要件

# 準備
1. Windows11+Docker+VSCodeによる開発環境を準備

2. awsアカウント情報を格納したconfigファイルを作成

```bash
$ aws configure
# AWS Access Key ID={awsアカウント情報から取得}
# AWS Secret Access Key={awsアカウント情報から取得}
# Default region name=ap-northeast-1
# Defaultoutputformat=None
```
* awsコマンドがインストールできていない場合は[こちら](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)を参照

2. Dockerイメージのビルド

```
# (初回のみ)
sudo usermod -aG docker $USER # 再起動必要

$ git clone {}
$ cd EnvHuMOB2024

# cpuのみ環境の場合
$ docker compose -f compose.cpu.yaml up 
# GPUあり環境の場合
$ docker compose -f compose.yaml up 
```

3. Dockerコンテナをビルド

4. DevContainerから環境に入る

# What is this
kaggle docker can use GPU  

worked on docker version 24.x.x higher

how to build and run
```bash
$ cd my_kaggle_docker

# cpuのみ環境の場合
$ docker compose -f compose.cpu.yaml up 
# GPUあり環境の場合
$ docker compose -f compose.yaml up 
```

# acess jupyter notebook
acess here http://127.0.0.1:8888  
default jupyter notebook password is "kaggle"  
if u want to change password, look run.sh  

# Attach to a running container
In Visual Code, using attach to a running container.
https://code.visualstudio.com/docs/devcontainers/attach-container#_attach-to-a-docker-container

# setting default python
default python switch
```bash
$ alias python='/opt/conda/bin/python'
```

if u want to conda activate
```bash
$ source /opt/conda/bin/activate
```
