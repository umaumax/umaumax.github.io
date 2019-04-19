# パーティション memo

## 基本パーティション
最大で4個
起動ドライブとして指定可能らしい

## 論理パーティション
最大で128個?
起動ドライブとして指定可能ではないらしい

基本的には，論理パーティションを区切っていくことになるはず
途中で拡張することを前提とする場合には，空き領域を確保すると良い
そのためには，一旦仮の領域を確保してから次の領域を指定してから，その前の領域を開放すれば良い

----

### Ubuntuのインストール時のパーティションの設定
Ubuntuのマウントポイントはプルダウンメニューになっているが，そこに`/swap`はなく，その回答としてはファイルシステムとして`スワップ領域`を選択すること

適当に考えた構成例

* SSD
  * /boot(ext4): 1024MB
  * (swap):      8192MB
  * /(ext4):     xxxMB

* HDD(プラグアンドプレイではないので，予め起動する前に取り付けておくこと)
  * /home(ext4): xxxMB

* ブートローダーをインストールするデバイスをSSDに選んでおく

----

なお，HDDに`/home`を設定し，それを外して起動すると
`Welecome to emergency mode!`となる
日本語のremixのUbuntuの場合にはdefaultで
`LANG=ja_JP.UTF-8`となっているので，
`export LANG=en_US.UTF-8`
としてから操作するとよい
また，なぜか英語キーボードでの配置で操作することになった

----

なお，macでext4形式のdiskをmountするには`ext4fuse`が必要となる
```
$ brew cask install osxfuse
$ brew install ext4fuse
```

[Unable to mount ext4 disk · Issue \#340 · osxfuse/osxfuse]( https://github.com/osxfuse/osxfuse/issues/340 )
```
# see `diskutil list` IDENTIFIER item which TYPE is `Linux`
sudo ext4fuse /dev/disk2s5 /Volumes/ext4_UNTITLED -o allow_other
```