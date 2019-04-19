# github.io

[https://umaumax\.github\.io]( https://umaumax.github.io/ )

## gitbook
### install
```
$ npm install -g gitbook-cli
$ gitbook --version
```

### how to use
```
$ gitbook init

# edit SUMMARY.md

$ gitbook build
# _book has created

# local server test
$ gitbook serve
```

### plugin
gitbook summary generator
```
$ npm install -g gitbook-summary
$ book sm
```
ディレクトリ名を複数形にすると，中身が1つでも階層構造として判断されるが，中身が複数ならば階層構造となるっぽい?
[imfly/gitbook\-summary: A command line tool to generate a summary\.md for Gitbook]( https://github.com/imfly/gitbook-summary )

### book.json
```
{
    "plugins": ["-sharing","hide-published-with"],
    "language": "ja"
}
```

```
gitbook install
```

----

## FMI

## 構造(old)
```
README.md
index.html
.contents
  README.md
  SUMMARY.md
  _book -> ../
  docs
```

### how to update
1. run `.build.sh`
1. git commit and push
1. wait several minutes
1. access [Introduction · GitBook]( https://umaumax.github.io/ )

### pseudo daemon on mac
`crontab ~/crontab`
```
*/5 * * * * $HOME/umaumax.github.io/.contents/.daemon.sh
```
`.daemon.sh`
```
#!/usr/bin/env sh
# /bin:/usr/bin
PATH=/usr/sbin:/usr/local/bin/:$PATH

cd $(dirname $0)
logfile='.gitbook.log'
port='4000'

type gitbook >/dev/null 2>&1
[[ $? != 0 ]] && echo 'no gitbook command' >>$logfile 2>&1 && exit 1

lsof -i:$port >/dev/null 2>&1
[[ $? == 0 ]] && exit 0 # running now

gitbook --port $port serve >>$logfile 2>&1 &
```
FMI:[【mac】cron で定期走行させる際はデフォルトで無効になっているログ\(crond\)を有効にしましょう。 – ソーシャルゲーム基盤 運用側から見渡す解像度]( http://www.hachim.jp/mac/mac-cron-log.html )

### ページ表示の優先順位
1. index.html
2. README.md(htmlにパースされて表示?)
