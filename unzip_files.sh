#!/bin/bash

for file in ./tmp/*.zip
do
  filename=$(basename "$file")
  # その他のファイルは元のディレクトリに解凍
  UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE unzip -d ./data/input/ "$file"
  
done