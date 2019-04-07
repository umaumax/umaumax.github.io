# camera calibration

* [カメラ キャリブレーションとは \- MATLAB & Simulink \- MathWorks 日本]( https://jp.mathworks.com/help/vision/ug/camera-calibration.html )
  * とてもわかりやすい
* [カメラの内部パラメータ、外部パラメータ、歪み、復習用 \- Qiita]( https://qiita.com/ryokomy/items/fee2105c3e9bfccde3a3 )
* [カメラキャリブレーション]( https://www.slideshare.net/TakuyaMizoguchi/ss-65111488 )
* [カメラキャリブレーション — OpenCV\-Python Tutorials 1 documentation]( http://labs.eecs.tottori-u.ac.jp/sd/Member/oyamada/OpenCV/html/py_tutorials/py_calib3d/py_calibration/py_calibration.html )
* [カメラキャリブレーションと3次元再構成 — opencv 2\.2 documentation]( http://opencv.jp/opencv-2svn/cpp/camera_calibration_and_3d_reconstruction.html )

## カメラパラメータ
* カメラパラメータは1.内部パラメータと2.外部パラメータ，3.歪み係数によって構成される
* OpenCVのカメラキャリブレーションは，Z.Zhangの手法を基に実装
  * "A flexible new technique for camera calibration". IEEE Transactions on Pattern Analysis and Machine Intelligence, 22(11):1330-1334, 2000.

### 1.内部パラメータ(intrinsic parameters)
* カメラ行列(内部パラメータ行列とも呼ばれる)
  * 3x3行列で表現される(opencv)
  * 焦点距離(fx,fy)
  * 光学中心(主点)(cx,cy)
  * ピクセルせん断(skew)(s=0とする場合が多いらしい)
  * 3次元世界のシーンをイメージ平面(2D)にマッピングする

* 4行3列(座標表現は行ベクトルの場合)(matlabの場合にはcamera matrix=外部パラメータ行列xopencvのカメラ行列としている)
* カメラの外部パラメーターと内部パラメーターを使用してカメラ行列を計算する
  * 外部パラメーターは 3 次元シーンにおけるカメラの位置を表す
  * 内部パラメーターはカメラの光学的中心と焦点距離を表す
  * ワールド座標点は外部パラメーターを使ってカメラ座標に変換され，カメラ座標は内部パラメーターを使ってイメージ平面にマッピングされる。

* 画素のスケーリングファクター
* レンズ歪係数(半径方向歪み係数 k1、k2、k3, ... と 接線方向歪み係数 p1、p2からなる。)
  * 高次の係数は必ずしも考慮する必要はない

### 2.外部パラメータ(extrinsic parameters)
* [カメラ外部パラメータとは \| NO MORE\! 車輪の再発明]( https://mem-archive.com/2018/02/17/post-74/ )
* 対象物を固定した場合の相対的な位置関係
    * 回転ベクトル：
      * ワールド座標におけるカメラの向き。( 3 × 3 )
    * 並進ベクトル：
      * ワールド座標におけるカメラの位置。( 3 )
* カメラの座標系の原点は光学的中心
  * 基本的に
    * x軸とy軸でイメージ平面(左上が原点で，右(x+)，下(y+))
    * z軸はカメラの向いている方向を+
* 4行3列(座標表現は行ベクトルの場合)
  * 場合によっては，4x4や3x4で表現される
  * 同次座標の行への追加?により，平行移動を表現?(座標表現は行ベクトルの場合)

### 3.歪み係数(歪収係数)(distortion coefficients)
* k1,k2,p1,p2

## 用語
### 座標変換
* [第7章 座標変換]( https://web.wakayama-u.ac.jp/~tokoi/lecture/gg/ggbook03.pdf )
* [7章 行列と線型変換]( ftp://ftp.oreilly.co.jp/9784873113777/g3d_sample02.pdf )
  * WARN: pdf by ftp protocol

* 座標変換の種類
  * 線型変換(一次変換)
  * アフィン変換
  * 可逆変換
  * 角度保存変換
  * 直交変換
  * 剛体変換

### 線型変換
* e.g. 正方行列(square matrix)(行要素の数と列要素の数が一致する行列)は線形変換

### アフィン変換
* 線型変換 + 平行移動
  * つまり，線型変換∈アフィン変換
* 同次座標を利用して表される

### 可逆変換
* 基本的に，投影以外の座標変換は可逆
  * オブジェクトが投影されると，1次元分の情報を破棄しているので，明らかに不可逆
* 逆行列を持たない行列による変換は不可逆

### 角度保存変換
* 平行移動/回転/均等スケーリングのみ
* すべての角度保存変換∈アフィン変換
* すべての角度保存変換∈可逆変換

### 直交変換
* 平行移動/回転/リフレクションのみ
* すべての直行変換∈アフィン変換
* すべての直行変換∈可逆変換
* 長さ/角度/面積/体積はすべて保持される

#### 剛体変換
[変換が剛体変換かどうかの判別 \- MATLAB isRigid \- MathWorks 日本]( https://jp.mathworks.com/help/images/ref/affine2d.isrigid.html )
> 剛体変換には、回転と平行移動のみが含まれます。鏡映を含まず、入力オブジェクトのサイズや形状を変更しません。

* 単純な例で考えると，現実にある物体(剛体)を人の手で動かす移動はすべて剛体変換なのでは?
* 形が変化しないアフィン変換
* 長さ/角度/面積/体積はすべて保持される
* 平行移動・回転のみ
* すべての剛体変換∈直行変換
* すべての剛体変換∈角度保存変換
* すべての剛体変換∈可逆変換
* すべての剛体変換∈アフィン変換
* 剛体変換は固有変換として知られる
* 回転行列の行列式は`1`

### 座標
#### 同次座標
* [同次座標系]( http://wwwb.pikara.ne.jp/ogawa-giken/image_process/image_062.html )
* [第10回目]( http://www.eli.hokkai-s-u.ac.jp/~kikuchi/ma2/chap10a.html )

* 同次座標は表現しようとする座標よりも1次元分多い座標
  * 実際の座標値は新規追加した要素の値を`w`としたとき，`x/w`,`y/w`,`z/w`となる
  * `w=0`の場合には特定方向の無限遠点を表す(e.g. 光源座標に使われる)
  * 平行移動(列+1)とスケール(列+1, 行+1)が実現できる(アフィン変換が可能となる)
    * 上記は，座標が列ベクトルの場合で，行ベクトル表現では逆となる
    * 拡張した座標表現のベクトルとは異なる方向の値は`0`とするのが普通?
