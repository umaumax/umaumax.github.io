# shell cmd

[Mac OS で大量の、スペースがファイル名に含まれるファイルも含めて全てrmする \- Qiita]( https://qiita.com/shy_azusa/items/d590f8802a7a24387bf1 )

> find . -type f -print0 | xargs -0 rmで解決!
> findは-print0オプションでスペースを\0にして、xargsは-0オプションでスペースを\0にして処理してくれるみたいです。

