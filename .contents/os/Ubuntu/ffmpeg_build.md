# ubuntu ffmepg self build

* [FFmpeg 3\.1\.3 released, Install on Ubuntu 16\.04 & Ubuntu 14\.04 · Sysads Gazette]( https://sysads.co.uk/2016/08/31/ffmpeg-3-1-3-released-install-ubuntu-16-04-ubuntu-14-04/ )
* [Ubuntu 16\.04: FFmpeg 3\.0をビルドしてインストールする \- Narrow Escape]( https://www.hiroom2.com/2016/04/26/ubuntu-16-04%E3%81%ABffmpeg-3-0%E3%82%92%E3%83%93%E3%83%AB%E3%83%89%E3%81%97%E3%81%A6%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99%E3%82%8B/ )

## Ubuntu16.04 default lib versions
```
$ ls /usr/lib/x86_64-linux-gnu/lib*ffmpeg* | cat
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.a
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.so
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.so.56
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.so.56.60.100
/usr/lib/x86_64-linux-gnu/libavdevice-ffmpeg.so.56
/usr/lib/x86_64-linux-gnu/libavdevice-ffmpeg.so.56.4.100
/usr/lib/x86_64-linux-gnu/libavfilter-ffmpeg.so.5
/usr/lib/x86_64-linux-gnu/libavfilter-ffmpeg.so.5.40.101
/usr/lib/x86_64-linux-gnu/libavformat-ffmpeg.a
/usr/lib/x86_64-linux-gnu/libavformat-ffmpeg.so
/usr/lib/x86_64-linux-gnu/libavformat-ffmpeg.so.56
/usr/lib/x86_64-linux-gnu/libavformat-ffmpeg.so.56.40.101
/usr/lib/x86_64-linux-gnu/libavresample-ffmpeg.so.2
/usr/lib/x86_64-linux-gnu/libavresample-ffmpeg.so.2.1.0
/usr/lib/x86_64-linux-gnu/libavutil-ffmpeg.a
/usr/lib/x86_64-linux-gnu/libavutil-ffmpeg.so
/usr/lib/x86_64-linux-gnu/libavutil-ffmpeg.so.54
/usr/lib/x86_64-linux-gnu/libavutil-ffmpeg.so.54.31.100
/usr/lib/x86_64-linux-gnu/libpostproc-ffmpeg.so.53
/usr/lib/x86_64-linux-gnu/libpostproc-ffmpeg.so.53.3.100
/usr/lib/x86_64-linux-gnu/libswresample-ffmpeg.a
/usr/lib/x86_64-linux-gnu/libswresample-ffmpeg.so
/usr/lib/x86_64-linux-gnu/libswresample-ffmpeg.so.1
/usr/lib/x86_64-linux-gnu/libswresample-ffmpeg.so.1.2.101
/usr/lib/x86_64-linux-gnu/libswscale-ffmpeg.a
/usr/lib/x86_64-linux-gnu/libswscale-ffmpeg.so
/usr/lib/x86_64-linux-gnu/libswscale-ffmpeg.so.3
/usr/lib/x86_64-linux-gnu/libswscale-ffmpeg.so.3.1.101
```

上記には，`-ffmepg`なしのライブラリが存在する
e.g.
```
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.a
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.so
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.so.56
/usr/lib/x86_64-linux-gnu/libavcodec-ffmpeg.so.56.60.100
/usr/lib/x86_64-linux-gnu/libavcodec.a
/usr/lib/x86_64-linux-gnu/libavcodec.so
```

これらのライブラリのデフォルトのversionはUbuntu18.04では合致しないため，
例えば，Ubuntu18.04でbuildしたバイナリをUbuntu16.04で利用するときに，不都合が生じる
下記の手順は実行時リンクのライブラリの解消を行うためのものである

----

## how to build
```
git clone https://github.com/FFmpeg/FFmpeg
cd FFmpeg
git checkout n3.0.1 -b n3.0.1

# NOTE
# ./configure --help
# で確認すること--enable-sharedのオプションが見つかった

./configure \
  --toolchain=hardened \
  --enable-shared
```

`--enable-shared`を付加しないと`.a`のみしかbuildしないので注意
```
$ git ls-files --other --ignored --exclude-standard | grep ".*\.a$"
libavcodec/libavcodec.a
libavdevice/libavdevice.a
libavfilter/libavfilter.a
libavformat/libavformat.a
libavutil/libavutil.a
libswresample/libswresample.a
libswscale/libswscale.a
```

```
$ git ls-files --other --ignored --exclude-standard | grep ".*\.so"
libavcodec/libavcodec.so
libavcodec/libavcodec.so.57
libavdevice/libavdevice.so
libavdevice/libavdevice.so.57
libavfilter/libavfilter.so
libavfilter/libavfilter.so.6
libavformat/libavformat.so
libavformat/libavformat.so.57
libavutil/libavutil.so
libavutil/libavutil.so.55
libswresample/libswresample.so
libswresample/libswresample.so.2
libswscale/libswscale.so
libswscale/libswscale.so.4
```

```
make -j3 |& tee build.log
```
