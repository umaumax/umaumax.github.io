# 配列

[bash 配列まとめ]( https://qiita.com/b4b4r07/items/e56a8e3471fb45df2f59 )
[bashの配列変数に関するTips \- y\-kawazの日記]( http://d.hatena.ne.jp/y-kawaz/20100720/1279607344 )
[シェルスクリプトで、ある順番以降の引数を取得する]( https://qiita.com/kentaro/items/db9944429ef160987b3a )

## 添字
for文での処理では`bash`と`zsh`番号のずれを意識せずに記述できるが，
```
ARRAY=("aaa" "bbb" "ccc" "ddd" "eee")
for X in ${ARRAY[*]}; do
  echo ${X}
done
```

## 展開
`${keyword[@]}`:配列を展開
`${@:1}`:第一引数以降
```
local keyword=${@:1} # 配列を文字列として代入
local keyword=(${@:1}) # 配列を配列として代入
```

