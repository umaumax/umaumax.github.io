# Shell Style Guide

[Shell Style Guide]( http://google.github.io/styleguide/shell.xml )

## 適当に抜粋したルール一覧

### ファイルの拡張子は`.sh`
* [File_Extensions]( http://google.github.io/styleguide/shell.xml?showone=File_Extensions#File_Extensions )

### エラー文字列はstderrを利用する

* [STDOUT vs STDERR]( http://google.github.io/styleguide/shell.xml?showone=STDOUT_vs_STDERR#STDOUT_vs_STDERR )

### shebangは`#!/bin/bash`

* [File Header]( http://google.github.io/styleguide/shell.xml?showone=File_Header#File_Header )

### Indent 2 spaces. No tabs.

* [Indentation]( http://google.github.io/styleguide/shell.xml?showone=Indentation#Indentation )

### Use `$(command)` instead of backticks.

* [Shell Style Guide]( http://google.github.io/styleguide/shell.xml?showone=Command_Substitution#Command_Substitution )

### `[[ ... ]]` is preferred over `[`, test and `/usr/bin/[.`

* [Test, \[ and \[\[]( http://google.github.io/styleguide/shell.xml?showone=Test,_%5B_and_%5B%5B#Test,_%5B_and_%5B%5B )

### `function`は使用しない

* [Function_Names]( http://google.github.io/styleguide/shell.xml?showone=Function_Names#Function_Names )

### ファイル名: maketemplate or make_template but not make-template.

* [Source Filenames]( http://google.github.io/styleguide/shell.xml?showone=Source_Filenames#Source_Filenames )

### 長いコードは`main(){}`を利用し，`main "$@"`で呼び出す

[main]( http://google.github.io/styleguide/shell.xml?showone=main#main )

----

## FMI

* [Googleの肩に乗ってShellコーディングしちゃおう \- Qiita]( https://qiita.com/laqiiz/items/5f72ca668f1c58176644 )
