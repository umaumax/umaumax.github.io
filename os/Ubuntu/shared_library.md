# shared library

## xxx: error while loading shared libraries: yyy
* [Linux: ライブラリの動的リンクでエラーが出た場合の対処方法]( https://leico.github.io/TechnicalNote/Linux/ld-library-path )
* [\(6\) ldconfigでライブラリパスを更新 – Linuxやってみる！]( https://www.dogrow.net/linux/blog6/ )

* まず，`ldd`で依存ライブラリの確認
* 一時的な解決策としては，
```
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib ./path_to_bin_file
```

### search order
1. 環境変数で指定されたパス
  * LD_LIBRARY_PATH
  * LD_LIBRARY_PATH_64
2. /etc/ld.so.conf に記述されたパス
3. 通常ライブラリが置かれるパス
  * /lib (/usr/lib への symbolic link)
  * /lib64 (/usr/lib64 への symbolic link)
