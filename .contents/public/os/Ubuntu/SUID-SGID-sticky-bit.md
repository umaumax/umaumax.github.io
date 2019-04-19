# SUID, SGID, Sticky bit

[LPIC Linux - SUID SGID スティッキービット](http://www.infraeye.com/study/linuxz27.html)


## TL;DR
```
$ sudo cp `which sh` .
$ sudo chmod u+s sh
$ sudo chmod g+s sh
$ ./sh -p -c whoami
```

* `-p`のflagがミソ
* 作成したshファイルはどのユーザでも利用することができるので注意．苦し紛れの策として、shファイルがあるディレクトリに`chmod o-rwx`を行うとディレクトリの内部が見えなくなるので少しはましになるが，根本的か解決策ではない

