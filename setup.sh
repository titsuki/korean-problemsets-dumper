#!/bin/bash

set -e

# TOPIK 1800

## 1. Prepare audio files
wget -nc https://www.goken-net.co.jp/audio/download_files/9784876153916w.zip
mkdir -p audio
yes | unzip 9784876153916w.zip
mv 9784876153916-2/*/*.mp3 audio/

## 2. Prepare a jsonl file
wget -nc https://raw.githubusercontent.com/titsuki/topik1800/refs/heads/main/ops.txt
wget -nc https://raw.githubusercontent.com/titsuki/topik1800/refs/heads/main/apply-swap-ops.raku
yes | unzip TOPIK__.apkg
echo "select flds from notes" | sqlite3 collection.anki21 | raku -ne '.split(/<:Cc>/)[0].say' > kr.txt
echo "select flds from notes" | sqlite3 collection.anki21 | raku -ne '.split(/<:Cc>/)[1].say' > ja.txt

cat kr.txt | raku -e '.say for $*IN.lines' > tmp
raku apply-swap-ops.raku --outfile=kr.txt tmp ops.txt
cat ja.txt | raku -e '.say for $*IN.lines' > tmp
raku apply-swap-ops.raku --outfile=ja.txt tmp ops.txt
raku gen-dictation-jsonl.raku > topik1800-problemsets.jsonl
