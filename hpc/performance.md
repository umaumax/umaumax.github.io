# hpc performance

* [本の虫: 2012/05 全プログラマーが知るべきレイテンシー数]( https://cpplover.blogspot.com/2012/05/ )

* [CG\_Yasui\_201605\.pptx]( https://www.imi.kyushu-u.ac.jp/PDF/Yasui_20160611.pdf )
  * p.13

Pentium 4世代の値(2000~2008)

|                                 | bandwidth(GB/s) | latency(ns) |
|---------------------------------|-----------------|-------------|
| レジスタ                        | 50~500          |             |
| キャッシュメモリ(L1,L2,TLB,L3)) | 5~20            |             |
| RAM                             | 2.5~10          |             |
| NV-RAM(SSD)                     | 6               |             |
| HDD                             | 0.05~0.5        |             |

TODO: diskアクセスの表
nfs: Ethernet 100MBits/sec -> 10MB/sec
nfs: Ethernet 1GBits/sec -> 100MB/sec

