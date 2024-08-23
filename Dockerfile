FROM gcr.io/kaggle-gpu-images/python:v144

#言語と地域の設定
ENV lang="ja_jp.utf-8" language="ja_jp:ja" lc_all="ja_jp.utf-8"

#ライブラリのインストール
WORKDIR /kaggle

# s3fsのインストール
RUN apt-get update && \
    apt-get install -y s3fs && \
    rm -rf /var/lib/apt/lists/*

# mount-s3のインストール
RUN apt-get install -y wget && \
    wget https://s3.amazonaws.com/mountpoint-s3-release/latest/x86_64/mount-s3.deb && \
    apt-get install -y ./mount-s3.deb && \
    rm -rf /var/lib/apt/lists/* ./mount-s3.deb

# AWS CLIのインストール
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm -rf aws awscliv2.zip

#各々のGPUに対応するpytorchをインストールhttps://pytorch.org/get-started/previous-versions/
# RUN pip install torch==2.0.1+cu117 torchvision==0.15.2+cu117 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu117
# 今回立ち上げた環境のcudaは12.1
RUN pip install torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cu121 
ADD requirements.txt /kaggle/requirements.txt
RUN pip install -r requirements.txt

#jupyter notebookの起動
ADD run.sh /opt/run.sh
RUN chmod 700 /opt/run.sh
CMD /opt/run.sh