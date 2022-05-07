# はじめに
Windowsリモートデスクトップのシャドウセッションの開始を自動で行うスクリプトです。

# 使用方法
ShadowSession.batをダウンロードする。
その後、ShadowSession.batの以下を編集し、実行する。
```bat=
set winip=Target IP Address
set username=Target UserName
set password=Target Password 
```
# トラブルシューティング
動作しなかった場合、16行目の末尾に
```
/prompt
```
を追加してください。
