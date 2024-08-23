# 概要
ubuntu環境で動作するDockerコンテナを用意
コンテナ内にて分析作業を実施する

GPUが存在する場合と存在しない場合それぞれに対応して環境を準備
- geoblueをインストール

# 分析環境の構築手順
## GPUを持たないPCの場合
PC(OS:windows11)にてGPUを持たないPCで行う場合 e.g.)シンARISE-PCなど


1. vscodeにてWSLを用いてubuntu環境に入る
以下の準備状況を確認してください
- vscode
- Windows Subsystem for Linux
- Ubuntu
- DockerDesktop or Docker(CLI) 
![プレゼンテーション2](https://github.com/user-attachments/assets/46d55231-a4cc-41f6-b05d-64e3f27e46b0)

2. AWSログインIDを環境変数に設定※S3のマウントに必要
```shell
export your_access_key={AWSアクセスキー}
export your_secret_access_key={AWSシークレットアクセスキー}
export your_default_region=ap-northeast-1
```

2. Dockerコンテナの作成

```shell
# (初回のみ)
sudo usermod -aG docker $USER # 再起動必要

mkdir {hoge} # 必ず作業用のディレクトリを作成してください
cd {hoge}
git clone https://github.com/takuya-tokumoto/EnvHuMOB2024.git
cd EnvHuMOB2024

# cpuのみ環境の場合
docker compose -f compose.cpu.yaml up 
```

4. DevContainerから環境に入る

## GPUを持つPCの場合
1,3の手順は同じですが2にて以下のコマンドにてコンテナを作成してください

```shell
# GPUあり環境の場合
docker compose -f compose.yaml up 
```

# 利用方法
## 作業ディレクトリ
`/kaggle`内に作業用ディレクトリが用意されています

## jupyter notebookでの環境指定
![Animation](https://github.com/user-attachments/assets/fe08f7cf-ee47-438e-8e54-02c7f1325075)


## gitの操作
コンテナ内と外でgitの設定が変わるのでコンテナ内からgit pushなどはできないです
コンテナ外から操作を行うかコンテナ内の権限、git cohfig情報を設定することで対応してください
