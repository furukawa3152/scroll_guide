#!/bin/bash
# Scrollガイドサイト用の画像をコピーするスクリプト

# 画像ディレクトリを作成
mkdir -p images

# Scroll_introduction/imagesから必要な画像をコピー
cp ../../Scroll_introduction/images/scroll_logo.png images/
cp ../../Scroll_introduction/images/voice-ninja1.png images/
cp ../../Scroll_introduction/images/voice-ninja2.png images/
cp ../../Scroll_introduction/images/voice-samurai.png images/
cp ../../Scroll_introduction/images/machi-musume.png images/

echo "画像のコピーが完了しました！"
