# 概要
[HuMob Challenge 2024](https://wp.nyu.edu/humobchallenge2024/)用の環境構築手順  
手元のPCにてDockerコンテナを作成しコンテナ内にて開発する環境を準備してます  
![image](https://github.com/user-attachments/assets/6afe4e0b-9075-4b65-a062-127fe8222145)

対応状況
- データ分析に必要なライブラリ(numpy/pandas/polars/scikitlearn..)をインストール済み
- NNモデル用のpytorchをインストール済み
- [geoblue](https://github.com/yahoojapan/geobleu)をインストール済み
- ファイル共有用にAWS s3サービスを利用
- GPUありなしそれぞれに対応したDockerfileを用意

# 環境構築の手順
## GPUを持たないPCの場合
PC(OS:windows11)にてGPUを持たないPCで開発する場合 (e.g.)シンARISE-PCなど

### 1. vscodeにてWSLを用いてubuntu環境に入る

以下の準備状況を確認してください
- vscode
  - Devcontainer
  - Remote-SSH
  - (あればもっとよし) autoDocstring
  - (あればもっとよし) isort
  - (あればもっとよし) Black Formatter
- Windows Subsystem for Linux 2(WSL2)
- Ubuntu
- DockerDesktop or Docker(CLI)
- GitHub 
![プレゼンテーション2](https://github.com/user-attachments/assets/46d55231-a4cc-41f6-b05d-64e3f27e46b0)

### 2. AWSログインIDを環境変数に設定※S3のマウントに必要  
```shell
$ export your_access_key={AWSアクセスキー}
$ export your_secret_access_key={AWSシークレットアクセスキー}
$ export your_default_region=ap-northeast-1
```

### 3. Dockerコンテナの作成  

```shell
# (初回のみ)
$ sudo usermod -aG docker $USER # 再起動必要

$ mkdir {hoge} # 必ず作業用のディレクトリを作成してください
$ cd {hoge}
$ git clone https://github.com/takuya-tokumoto/EnvHuMOB2024.git
$ cd EnvHuMOB2024

# cpuのみ環境の場合
$ docker compose -f compose.cpu.yaml up 
```

### 4. DevContainerから環境に入る  
![Animation](https://github.com/user-attachments/assets/cbe9c6bf-42e5-4a39-b326-6a713ce83750)


## GPUありPCの場合
1,2,4の手順は同じですが3にて以下のコマンドにてコンテナを作成してください

```shell
# GPUあり環境の場合
$ docker compose -f compose.yaml up 
```

# Tips
## 作業ディレクトリの場所について
コンテナ内の`/kaggle`内に作業用ディレクトリを用意  
`/kaggle`内はコンテナ内外でファイル共有できるようにしているため開発コードは`/kaggle`配下に配置してください  

## ファイル共有方法について
AWS s3サービスによって各個人間でファイルのやり取りができます  
マートの中間生成物や学習済みモデルの重みなどは`/kaggle/s3storage/01_public/humob-challenge-2024`配下へ格納してください  

今回のコンペデータは以下に格納済みです
- `/kaggle/s3storage/01_public/humob-challenge-2024/input`

## jupyter notebookでの環境指定について
notebookでスクリプトを実行する際にはpython environmentから`/opt/conda/bin/python`を選択してください
![Animation](https://github.com/user-attachments/assets/fe08f7cf-ee47-438e-8e54-02c7f1325075)

## git操作について
コンテナ内外で権限やgit設定が変更されるので現設定ではコンテナ内から`git push`などができないです  
コンテナ外から操作を行うかコンテナ内の権限、git cohfig情報を設定することで対応してください  
