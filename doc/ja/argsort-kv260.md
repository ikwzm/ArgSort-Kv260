
# VHDL で書くマージソーター(ArgSort-Kv260)



## はじめに


別記事 [「はじめに」] を参照してください。

この記事では[「Argsort IP」] で紹介した ArgSort_AXI IP を Kv260 に実装した結果を紹介します。

この記事で説明する ArgSort-Kv260 はGitHub にて公開しています。
* https://github.com/ikwzm/ArgSort-Kv260




## ArgSort-Kv260 のデザイン



### デザインブロック


ArgSort-Kv260 は次図のようなデザインになっています。


![Fig.1 ArgSort-Kv260 のデザインブロック](./argsort-kv260-bd.png "Fig.1 ArgSort-Kv260 のデザインブロック")

Fig.1 ArgSort-Kv260 のデザインブロック

<br />



ArgSort_AXI のバージョンは 1.2 です。前々回説明した[「ArgSort IP」]で説明した IP のバージョンは 1.3 ですが、[「ArgSort-Ultra96」] と同じ環境にするために1.2を使用しています。



ArgSort_AXI の STM_AXI は [ZynqMP-ACP-Adapter] を通して PS 部の S_AXI_ACP_FPD に接続しています。[ZynqMP-ACP-Adapter] と ACP に関する詳細な説明は次の記事を参照してください。
  * [『ZynqMP ACP と AXI をつなぐアダプタ』 @Qiita]



ArgSort_AXI、 ZynqMP-ACP-Adapter、AXI Interconnect のクロックは  Clock Wizard によって 220MHz または 250MHz を生成されたものを使っています。Clock Wizard には PS部の pl_clk0 が生成した100MHz のクロックが入力されます。


### ArgSort_AXI のパラメータの設定値


ArgSort_AXI の主なパラメーターは次のように設定しています。これらのパラメーターのうち、MRG_WAYS、MRG_WORDS、STM_FEEDBACK の値を振ってそれ毎にビルドしたリソース量と実行時間を計測しました。



Table.1 ArgSort_AXI の主なパラメータの設定値

<table border="2">
  <tr>
    <td align="center" colspan="2">Parameter</td>
    <td rowspan="2">Value</td>
  </tr>
  <tr>
    <td align="center">Categoly</td>
    <td align="center">Name</td>
  <tr>
    <td rowspan="7">CORE</td>
    <td>WORD_BITS</td>
    <td>32</td>
  </tr>
  <tr>
    <td>INDEX_BITS</td>
    <td>32</td>
  </tr>
  <tr>
    <td>COMP_SIGN</td>
    <td>FALSE</td>
  </tr>
  <tr>
    <td>SORT_ORDER</td>
    <td>0</td>
  </tr>
  <tr>
    <td>MRG_WAYS</td>
    <td>[16,32] (可変)</td>
  </tr>
  <tr>
    <td>MRG_WORDS</td>
    <td>[1,2](可変)</td>
  </tr>
  <tr>
    <td>STM_FEEDBACK</td>
    <td>[0,1,2] (可変)</td>
  </tr>
  <tr>
    <td rowspan="2">STM_AXI</td>
    <td>STM_AXI_ADDR_WIDTH</td>
    <td>64</td>
  </tr>
  <tr>
    <td>STM_AXI_DATA_WIDTH</td>
    <td>128</td>
  </tr>
  <tr>
    <td rowspan="2">MRG_AXI</td>
    <td>MRG_AXI_ADDR_WIDTH</td>
    <td>64</td>
  </tr>
  <tr>
    <td>MRG_AXI_DATA_WIDTH</td>
    <td>128</td>
  </tr>
</table>




## 結果



### 使用リソース


次表に MRG_WAYS、MRG_WORDS、STM_FEEDBACK を振ったそれぞれのデザインを Kv260 に実装した時のリソースの使用状況を示します。なお、MRG_WASY が64 以上は Kv260 で使われているデバイスには入りきりませんでした。また、MRG_WAYS が 32 かつ MRG_WORD が ２の場合、動作周波数が250MHz ではタイミング違反が発生したため、220MHz に落としています。



Table.2 Utilization

<table border="2">
  <tr>
    <td align="center" colspan="4">Design</td>
    <td align="center" colspan="5">Resources</td>
    <td align="center" rowspan="3">Freq<br />[MHz]</td>
  </tr>
  <tr>
    <td align="center" rowspan="2">Name</td>
    <td align="center" rowspan="2">MRG<br />WAYS</td>
    <td align="center" rowspan="2">MRG<br />WORDS</td>
    <td align="center" rowspan="2">STM<br />FB</td>
    <td align="center" colspan="2">CLB</td>
    <td align="center" colspan="2">BLOCK RAM</td>
    <td align="center" rowspan="2">DSPs</td>
  <tr>
    <td align="center">LUTs</td>
    <td align="center">Register</td>
    <td align="center">RAMB36</td>
    <td align="center">URAM</td>
  <tr>
    <td>argsort_16_1_0</td>
    <td align="center">16</td>
    <td align="center">1</td>
    <td align="center">0</td>
    <td align="right">42507</td>
    <td align="right">27176</td>
    <td align="right">38</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_16_1_1</td>
    <td align="center">16</td>
    <td align="center">1</td>
    <td align="center">1</td>
    <td align="right">42714</td>
    <td align="right">27843</td>
    <td align="right">38</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_16_1_2</td>
    <td align="center">16</td>
    <td align="center">1</td>
    <td align="center">2</td>
    <td align="right">42859</td>
    <td align="right">27014</td>
    <td align="right">54</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_16_2_0</td>
    <td align="center">16</td>
    <td align="center">2</td>
    <td align="center">0</td>
    <td align="right">59239</td>
    <td align="right">55627</td>
    <td align="right">38</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_16_2_1</td>
    <td align="center">16</td>
    <td align="center">2</td>
    <td align="center">1</td>
    <td align="right">60491</td>
    <td align="right">56881</td>
    <td align="right">38</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_16_2_2</td>
    <td align="center">16</td>
    <td align="center">2</td>
    <td align="center">2</td>
    <td align="right">58363</td>
    <td align="right">54870</td>
    <td align="right">70</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_32_1_0</td>
    <td align="center">32</td>
    <td align="center">1</td>
    <td align="center">0</td>
    <td align="right">66648</td>
    <td align="right">46134</td>
    <td align="right">70</td>
    <td align="right">0</td>
    <td align="right">15</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_32_1_1</td>
    <td align="center">32</td>
    <td align="center">1</td>
    <td align="center">1</td>
    <td align="right">69430</td>
    <td align="right">47579</td>
    <td align="right">70</td>
    <td align="right">0</td>
    <td align="right">15</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_32_1_2</td>
    <td align="center">32</td>
    <td align="center">1</td>
    <td align="center">2</td>
    <td align="right">68064</td>
    <td align="right">46136</td>
    <td align="right">70</td>
    <td align="right">32</td>
    <td align="right">15</td>
    <td align="center">250</td>
  </tr>
  <tr>
    <td>argsort_32_2_0</td>
    <td align="center">32</td>
    <td align="center">2</td>
    <td align="center">0</td>
    <td align="right">106793</td>
    <td align="right">103907</td>
    <td align="right">70</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">220</td>
  </tr>
  <tr>
    <td>argsort_32_2_1</td>
    <td align="center">32</td>
    <td align="center">2</td>
    <td align="center">1</td>
    <td align="right">109295</td>
    <td align="right">106776</td>
    <td align="right">70</td>
    <td align="right">0</td>
    <td align="right">0</td>
    <td align="center">220</td>
  </tr>
  <tr>
    <td>argsort_32_2_2</td>
    <td align="center">32</td>
    <td align="center">2</td>
    <td align="center">2</td>
    <td align="right">103651</td>
    <td align="right">103225</td>
    <td align="right">70</td>
    <td align="right">64</td>
    <td align="right">0</td>
    <td align="center">220</td>
  </tr>
  <tr>
    <td colspan="4">xck26-sfvc784-2LV-c resouce available</td>
    <td align="right">117120</td>
    <td align="right">234240</td>
    <td align="right">144</td>
    <td align="right">64</td>
    <td align="right">1248</td>
    <td align="center"></td>
  </tr>
</table>



Kv260 で使われているデバイスが持っている LUT の数のうち、使用した LUT の数を次図に示します。




![Fig.2 Utlization(LUTs %)](./argsort-kv260-resources.jpg "Fig.2 Utlization(LUTs %)")

Fig.2 Utlization(LUTs %)

<br />


### 性能


次表にMRG_WAYS、MRG_WORDS、STM_FEEDBACK を振ったそれぞれのデザインを Kv260 で実行した時にかかった時間とスループットを示します。

ソートするワード数は、5,000ワードから 1,000,000ワードまでを 5000 ワード毎にかかった時間を計測していますが、そのうち下の表には 10,000ワード、100,000ワード、1,000,000 ワードの時の時間を示しています。スループットは、5,000ワードから 1,000,000ワードまでを 5000 ワード毎に計測したスループット(ソートするワード数/かかった時間)の平均値を示しています。

参考までに最下行に ZynqMP の CPU(arm64) で numpy ライブラリの argsort() でソートした時間とスループットを示しています。



Table.3 Performance

<table border="2">
  <tr>
    <td align="center" colspan="4">Design</td>
    <td align="center" colspan="3">Sort time [msec]</td>
    <td align="center" rowspan="2">Throughput <br />Average<br />[Mwords/sec]</td>
  </tr>
  <tr>
    <td align="center">Name</td>
    <td align="center">MRG<br />WAYS</td>
    <td align="center">MRG<br />WORDS</td>
    <td align="center">STM<br />FB</td>
    <td align="center">10K<br />[words]</td>
    <td align="center">100K<br />[words]</td>
    <td align="center">1M<br />[words]</td>
  <tr>
    <td>argsort_16_1_0</td>
    <td align="center">16</td>
    <td align="center">1</td>
    <td align="center">0</td>
    <td align="right">0.445</td>
    <td align="right">3.277</td>
    <td align="right">34.805</td>
    <td align="right">28.59</td>
  </tr>
  <tr>
    <td>argsort_16_1_1</td>
    <td align="center">16</td>
    <td align="center">1</td>
    <td align="center">1</td>
    <td align="right">0.347</td>
    <td align="right">2.364</td>
    <td align="right">22.136</td>
    <td align="right">43.87</td>
  </tr>
  <tr>
    <td>argsort_16_1_2</td>
    <td align="center">16</td>
    <td align="center">1</td>
    <td align="center">2</td>
    <td align="right">0.353</td>
    <td align="right">2.270</td>
    <td align="right">21.287</td>
    <td align="right">45.67</td>
  </tr>
  <tr>
    <td>argsort_16_2_0</td>
    <td align="center">16</td>
    <td align="center">2</td>
    <td align="center">0</td>
    <td align="right">0.328</td>
    <td align="right">2.004</td>
    <td align="right">24.568</td>
    <td align="right">40.87</td>
  </tr>
  <tr>
    <td>argsort_16_2_1</td>
    <td align="center">16</td>
    <td align="center">2</td>
    <td align="center">1</td>
    <td align="right">0.274</td>
    <td align="right">1.214</td>
    <td align="right">17.030</td>
    <td align="right">59.95</td>
  </tr>
  <tr>
    <td>argsort_16_2_2</td>
    <td align="center">16</td>
    <td align="center">2</td>
    <td align="center">2</td>
    <td align="right">0.292</td>
    <td align="right">1.092</td>
    <td align="right">15.289</td>
    <td align="right">66.27</td>
  </tr>
  <tr>
    <td>argsort_32_1_0</td>
    <td align="center">32</td>
    <td align="center">1</td>
    <td align="center">0</td>
    <td align="right">0.338</td>
    <td align="right">2.393</td>
    <td align="right">24.882</td>
    <td align="right">39.59</td>
  </tr>
  <tr>
    <td>argsort_32_1_1</td>
    <td align="center">32</td>
    <td align="center">1</td>
    <td align="center">1</td>
    <td align="right">0.297</td>
    <td align="right">1.898</td>
    <td align="right">17.478</td>
    <td align="right">54.79</td>
  </tr>
  <tr>
    <td>argsort_32_1_2</td>
    <td align="center">32</td>
    <td align="center">1</td>
    <td align="center">2</td>
    <td align="right">0.566</td>
    <td align="right">2.285</td>
    <td align="right">19.921</td>
    <td align="right">47.65</td>
  </tr>
  <tr>
    <td>argsort_32_2_0</td>
    <td align="center">32</td>
    <td align="center">2</td>
    <td align="center">0</td>
    <td align="right">0.280</td>
    <td align="right">1.489</td>
    <td align="right">19.003</td>
    <td align="right">53.62</td>
  </tr>
  <tr>
    <td>argsort_32_2_1</td>
    <td align="center">32</td>
    <td align="center">2</td>
    <td align="center">1</td>
    <td align="right">0.239</td>
    <td align="right">1.184</td>
    <td align="right">13.765</td>
    <td align="right">72.11</td>
  </tr>
  <tr>
    <td>argsort_32_2_2</td>
    <td align="center">32</td>
    <td align="center">2</td>
    <td align="center">2</td>
    <td align="right">0.619</td>
    <td align="right">1.526</td>
    <td align="right">15.389</td>
    <td align="right">63.20</td>
  </tr>
  <tr>
    <td colspan="4">ZynqMP(arm64) numpy.argsort()</td>
    <td align="right">1.551</td>
    <td align="right">26.107</td>
    <td align="right">840.246</td>
    <td align="right">2.11</td>
  </tr>
</table>







次図にスループットの平均値をグラフで示します。


![Fig.3 Throughput Average [Mwords/sec]](./argsort-kv260-performance.jpg "Fig.3 Throughput Average [Mwords/sec]")

Fig.3 Throughput Average [Mwords/sec]

<br />




## テストの手順



### テスト環境

* ハードウェア: [Xilinx Kria Kv260 Vision AI Starter Kit]
* ソフトウェア: [ZynqMP-FPGA-Linux v2021.1.1] (Linux Kernel 5.10 + Debian 11)


### インストール



#### Kv260 の準備


Kv260 に ZynqMP-FPGA-Linux または ZynqMP-FPGA-Ubuntu20.04 をインストールします。インストール方法は次のURLを参照してください。
* https://github.com/ikwzm/ZynqMP-FPGA-Linux/blob/v2021.1.1/doc/install/kv260.md
* https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04/blob/v2021.1-desktop-1/doc/install/kv260-desktop.md
* [『UltraZed/Ultra96/Ultra96-V2/KV260 向け Debian GNU/Linux (v2021.1版) ブートイメージの提供』@Qiita]




#### ArgSort-Kv260 のダウンロード


次のように Kv260 に ArgSort-Kv260 をダウンロードします。


```console
fpga@debian-fpga:~/$ git clone --branch 1.2.1 git://github.com/ikwzm/ArgSort-Kv260.git
fpga@debian-fpga:~/$ cd ArgSort-Kv260
```





#### FPGA ビットストリームとデバイスツリーのインストール


次のようにテストの対象となるデザインのビットストリームファイルとデバイスツリーを Kv260 にインストールします。デバイスツリーのインストールには Device Tree Overlay を使用しています。インストールするための Rakefile を用意しているので、rake コマンドを実行してインストールします。環境変数 TARGET  にはデザイン名を指定します。


```console
fpga@debian-fpga:~/ArgSort-Kv260$ sudo TARGET=argsort_32_2_1 rake install
./dtbocfg.rb --install argsort --dts argsort_32_2_1_5.10.dts
<stdin>:27.16-32.20: Warning (unit_address_vs_reg): /fragment@2/__overlay__/uio_argsort: node has a reg or ranges property, but no unit name
<stdin>:18.13-52.5: Warning (avoid_unnecessary_addr_size): /fragment@2: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
[ 3617.061703] fpga_manager fpga0: writing argsort_32_2_1.bin to Xilinx ZynqMP FPGA Manager
[ 3617.538577] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /fpga-full/firmware-name
[ 3617.561601] u-dma-buf udmabuf-argsort-in: driver version = 3.2.4
[ 3617.567613] u-dma-buf udmabuf-argsort-in: major number   = 243
[ 3617.573445] u-dma-buf udmabuf-argsort-in: minor number   = 0
[ 3617.579099] u-dma-buf udmabuf-argsort-in: phys address   = 0x0000000070100000
[ 3617.586234] u-dma-buf udmabuf-argsort-in: buffer size    = 33554432
[ 3617.592503] u-dma-buf amba_pl@0:udmabuf_argsort_in: driver installed.
[ 3617.608308] u-dma-buf udmabuf-argsort-out: driver version = 3.2.4
[ 3617.614407] u-dma-buf udmabuf-argsort-out: major number   = 243
[ 3617.620323] u-dma-buf udmabuf-argsort-out: minor number   = 1
[ 3617.626064] u-dma-buf udmabuf-argsort-out: phys address   = 0x0000000072100000
[ 3617.633277] u-dma-buf udmabuf-argsort-out: buffer size    = 33554432
[ 3617.639636] u-dma-buf amba_pl@0:udmabuf_argsort_out: driver installed.
[ 3617.682789] u-dma-buf udmabuf-argsort-tmp: driver version = 3.2.4
[ 3617.688883] u-dma-buf udmabuf-argsort-tmp: major number   = 243
[ 3617.694800] u-dma-buf udmabuf-argsort-tmp: minor number   = 2
[ 3617.700542] u-dma-buf udmabuf-argsort-tmp: phys address   = 0x0000000074100000
[ 3617.707761] u-dma-buf udmabuf-argsort-tmp: buffer size    = 134217728
[ 3617.714202] u-dma-buf amba_pl@0:udmabuf_argsort_tmp: driver installed.

```



### テストの実行



#### サンプルデータの生成


ソートするデータのサンプルを用意します。サンプルデータを生成する Python スクリプト generage_sample.py を用意しています。生成するデータの大きさを指定してサンプルデータを生成します。このスクリプトを直接実行するか、rake コマンドから実行します。


```console
fpga@debian-fpga:~/ArgSort-Kv260$ rake sample_0001000000.npy
python3 generate_sample.py --size 1000000 --sample sample_0001000000.npy
generate_sample: sample_file : sample_0001000000.npy
generate_sample: size        : 1000000
generate_sample: time        : 46.06 [msec]

```



#### 期待値データの生成


サンプルデータを Python の numpy.argsort() を使ってソートしたデータを用意します。これは ArgSort-Kv260 によってソートした結果データと比較して正常にソートされたかをチェックするのに使います。期待値データを生成する Python のスクリプト generate_expect.py を用意しています。このスクリプトを直接実行するか、rake コマンドから実行します。ついでに期待値データを生成する時間を計測してログに残しておきます。


```console
fpga@debian-fpga:~/ArgSort-Kv260$ rake expect_0001000000.npy
python3 generate_expect.py --sample sample_0001000000.npy --expect expect_0001000000.npy --log expect.log
generate_expect: sample_file  : sample_0001000000.npy
generate_expect: expect_file  : expect_0001000000.npy
generate_expect: size         : 1000000
generate_expect: average_time :  954.065 # [msec]
generate_expect: throughput   :    1.048 # [mwords/sec]
```





#### ArgSort-Kv260 を実行


ArgSort-Kv260 を実行してサンプルデータをソートします。ソートされた結果のデータを保存し、ソートにかかった時間を計測してログに残します。ArgSort-Kv260 を実行する Python スクリプト argsort_test.py を用意しています。また、ArgSort-Kv260 がソートした結果と numpy.argsort() がソートして期待値とを比較します。比較する Python スクリプト check_result.py を用意しています。これらのスクリプトを直接実行するか、rake コマンドから実行します。


```console
fpga@debian-fpga:~/ArgSort-Kv260$ rake test_1000000
python3 argsort_test.py --sample sample_0001000000.npy --result result_0001000000.npy -n 10 -d 2 --log argsort_32_2_1.log
argsort_test   : Version      : 1.2
argsort_test   : Ways         : 32
argsort_test   : Words        : 2
argsort_test   : Feedback     : 1
argsort_test   : WordBits     : 32
argsort_test   : IndexBits    : 32
argsort_test   : Sort Order   : 0
argsort_test   : Sign Compare : 0
argsort_test   : Max Size     : 268435455
argsort_test   : Debug Enable : 1
argsort_test   : sample_file  : sample_0001000000.npy
argsort_test   : size         : 1000000
argsort_test   : debug_mode   : 2
argsort_test   : loops        : 10
argsort_test   : time         :   13.890 # [msec]
argsort_test   : time         :   13.813 # [msec]
argsort_test   : time         :   13.809 # [msec]
argsort_test   : time         :   13.822 # [msec]
argsort_test   : time         :   13.821 # [msec]
argsort_test   : time         :   13.823 # [msec]
argsort_test   : time         :   13.795 # [msec]
argsort_test   : time         :   13.813 # [msec]
argsort_test   : time         :   13.613 # [msec]
argsort_test   : time         :   13.820 # [msec]
argsort_test   : result_file  : result_0001000000.npy
argsort_test   : average_time :   13.802 # [msec]
argsort_test   : throughput   :   72.453 # [mwords/sec]
argsort_test   : Debug_Time(0):   11.903 # [msec]
argsort_test   : Debug_Time(1):    7.053 # [msec]
argsort_test   : Debug_Time(2):    2.534 # [msec]
argsort_test   : Debug_Time(3):    2.316 # [msec]
python3 check_result.py --sample sample_0001000000.npy --result result_0001000000.npy --expect expect_0001000000.npy
check_result: sample file : sample_0001000000.npy
check_result: expect file : expect_0001000000.npy
check_result: result file : result_0001000000.npy
check_result: OK
```



### アンインストール



#### デバイスツリーのアンインストール


テストが終わったらデバイスツリーをアンインストールします。別のデザインをインストールして実行するためには必ず現在のデザインをアンインストールしておく必要があります。アンインストールにもインストールと同様に Device Tree Overlay を使います。インストールと同様に rake コマンドを使ってアンインストールします。


```console
fpga@debian-fpga:~/ArgSort-Kv260$ sudo rake uninstall
./dtbocfg.rb --remove argsort
[  877.205843] u-dma-buf amba_pl@0:udmabuf_argsort_tmp: driver removed.
[  877.217907] u-dma-buf amba_pl@0:udmabuf_argsort_out: driver removed.
[  877.229861] u-dma-buf amba_pl@0:udmabuf_argsort_in: driver removed.
```





## デザインのビルド



### ビルド環境

* 開発ツール: Xilinx Vivado 2021.2
* IP: [ArgSort_AXI IP 1.2]、[ZynqMP-ACP-Adapter IP v0.4]




#### ArgSort-Kv260 のダウンロード


次のようにビルド用コンピューターに ArgSort-Kv260 をダウンロードします。


```console
shell$ git clone --branch 1.2.1 --recursive git://github.com/ikwzm/ArgSort-Kv260.git
shell$ cd ArgSort-Kv260
```





### ビルド用スクリプトファイル


各デザイン毎にスクリプトファイルを用意しています。 argsort_16_2\_2 を例にすると次のようになります。
* argsort_16_2\_2/
  * create_project.tcl
  * design_1.bif
  * design_1\_bd_2020.1.tcl
  * design_1\_bd_2020.2.tcl
  * design_1\_pin.xdc
  * implementation.tcl




### ビルド環境の設定


Xilinx Vivado 2021.2 が動作する環境を設定します。


```console
shell$ source /opt/Xilinx/Vivado/2021.2/settings64.sh
```





### プロジェクトの生成


プロジェクトを生成するためには、スクリプトが格納されているディレクトリに移動して vivado で create_project.tcl を実行します。以下の例では vivado のコマンドラインから実行しています。


```console
shell$ cd argsort_16_2_2
shell$ vivado -mode batch -source create_project.tcl
```



### 論理合成と配置配線


プロジェクトの論理合成と配置配線をしてビットストリームファイルを生成するためには implementation.tcl を使用します。


```console
shell$ vivado -mode batch -source implementation.tcl
```


生成されたビットストリームファイルは project.runs/impl_1/design_1\_wrapper.bit です。なお、このスクリプトでビットストリームファイルを生成した場合は、使用リソースやタイミングチェックなどのレポートファイル project.rpt が生成されます。




### バイナリ—ファイルの生成


ビットストリームファイルから PL はダウンロードするためのバイナリ—ファイルを生成するためには、bootgen コマンドと design_1.bif を使います。


```console
shell$ bootgen -image design_1.bif -arch zynqmp -w -o ../argsort_16_2_2.bin
shell$ cd ..
shell$ gzip argsort_16_2_2.bin
```





## 所感



### バス帯域について


ArgSort で使用しているマージソーターコアは[「マルチワード マージソート ノード」]で説明したように１クロックあたりに出力できるワード数を複数ワードにすることができます。[ArgSort_AXI IP 1.2] ではこのパラメータの値は MRG_WORDS で指定します。

本来ならこのパラメータを１から２に変更することで性能が倍になるはずです。しかし [「ArgSort-Ultra96」] では残念ながら次の表のようにそれほどの性能の差はみられませんでした。これは Ultra96-V2 のシステムメモリである DDR-SDRAM は32bit(4Byte)×2(DDR分)×533MHz で 4.264GByte/sec しかなかったために起こったものでした。

Table.4 Ultra96-V2 におけるMRG_WORDSの違いによる性能の比較

<table border="2">
  <tr>
    <td align="center" colspan="4">Design</td>
    <td align="center" rowspan="2">Throughput <br />Average<br />[Mwords/sec]</td>
    <td align="center" rowspan="2">MRG_WORDS<br />1-&gt; 2 Up [%]</td>
  </tr>
  <tr>
    <td align="center">Name</td>
    <td align="center">MRG<br />WAYS</td>
    <td align="center">MRG<br />WORDS</td>
    <td align="center">STM<br />FB</td>
  <tr>
    <td>argsort_16_1_0</td>
    <td align="center" rowspan="2">16</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">0</td>
    <td align="right">18.75</td>
    <td align="right" rowspan="2">28.69 % Up</td>
  </tr>
  <tr>
    <td>argsort_16_2_0</td>
    <td align="center">2</td>
    <td align="right">24.13</td>
  <tr>
    <td>argsort_16_1_1</td>
    <td align="center" rowspan="2">16</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">1</td>
    <td align="right">29.51</td>
    <td align="right" rowspan="2">14.84 % Up</td>
  </tr>
  <tr>
    <td>argsort_16_2_1</td>
    <td align="center">2</td>
    <td align="right">33.89</td>
  <tr>
    <td>argsort_16_1_2</td>
    <td align="center" rowspan="2">16</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">2</td>
    <td align="right">36.04</td>
    <td align="right" rowspan="2">11.02 % Up</td>
  </tr>
  <tr>
    <td>argsort_16_2_2</td>
    <td align="center">2</td>
    <td align="right">40.01</td>
</table>



Kv260 のシステムメモリである DDR-SDRAM は64bit(8Byte)×2(DDR分)×533MHz で 8.528GByte/sec と Ultra96-V2 の倍あります。そのため、次の表のようにUltra96-V2 の性能差に比較して差が開いています。



Table.5 Kv260 におけるMRG_WORDSの違いによる性能の比較 

<table border="2">
  <tr>
    <td align="center" colspan="4">Design</td>
    <td align="center" rowspan="2">Throughput <br />Average<br />[Mwords/sec]</td>
    <td align="center" rowspan="2">MRG_WORDS<br />1-&gt; 2 Up [%]</td>
  </tr>
  <tr>
    <td align="center">Name</td>
    <td align="center">MRG<br />WAYS</td>
    <td align="center">MRG<br />WORDS</td>
    <td align="center">STM<br />FB</td>
  <tr>
    <td>argsort_16_1_0</td>
    <td align="center" rowspan="2">16</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">0</td>
    <td align="right">28.59</td>
    <td align="right" rowspan="2">42.95 % Up</td>
  </tr>
  <tr>
    <td>argsort_16_2_0</td>
    <td align="center">2</td>
    <td align="right">40.87</td>
  <tr>
    <td>argsort_16_1_1</td>
    <td align="center" rowspan="2">16</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">1</td>
    <td align="right">43.87</td>
    <td align="right" rowspan="2">27.28 % Up</td>
  </tr>
  <tr>
    <td>argsort_16_2_1</td>
    <td align="center">2</td>
    <td align="right">59.95</td>
  <tr>
    <td>argsort_16_1_2</td>
    <td align="center" rowspan="2">16</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">2</td>
    <td align="right">45.67</td>
    <td align="right" rowspan="2">45.11 % Up</td>
  </tr>
  <tr>
    <td>argsort_16_2_2</td>
    <td align="center">2</td>
    <td align="right">66.27</td>
  <tr>
    <td>argsort_32_1_0</td>
    <td align="center" rowspan="2">32</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">0</td>
    <td align="right">39.59</td>
    <td align="right" rowspan="2">35.44 % Up</td>
  </tr>
  <tr>
    <td>argsort_32_2_0</td>
    <td align="center">2</td>
    <td align="right">53.62</td>
  <tr>
    <td>argsort_32_1_1</td>
    <td align="center" rowspan="2">32</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">1</td>
    <td align="right">54.79</td>
    <td align="right" rowspan="2">31.61 % Up</td>
  </tr>
  <tr>
    <td>argsort_32_2_1</td>
    <td align="center">2</td>
    <td align="right">72.11</td>
  <tr>
    <td>argsort_32_1_2</td>
    <td align="center" rowspan="2">32</td>
    <td align="center">1</td>
    <td align="center" rowspan="2">2</td>
    <td align="right">47.65</td>
    <td align="right" rowspan="2">32.63 % Up</td>
  </tr>
  <tr>
    <td>argsort_32_2_2</td>
    <td align="center">2</td>
    <td align="right">63.20</td>
</table>


## 参照

* 目次: [「はじめに」]
* 前回: [「ArgSort-Ultra96」]
* https://github.com/ikwzm/ArgSort-Kv260
* https://github.com/ikwzm/Merge_Sorter
* https://github.com/ikwzm/ZynqMP-FPGA-Linux
* https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04
* [『ZynqMP ACP と AXI をつなぐアダプタ』 @Qiita]
* [『UltraZed/Ultra96/Ultra96-V2/KV260 向け Debian GNU/Linux (v2021.1版) ブートイメージの提供』@Qiita]



[「はじめに」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/01_introduction.md "「VHDL で書くマージソーター(はじめに)」"
[「ワードの定義」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/02_word_package.md "「VHDL で書くマージソーター(ワードの定義)」"
[「ワード比較器」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/03_word_compare.md "「VHDL で書くマージソーター(ワード比較器)」"
[「ソーティングネットワーク」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/04_sorting_network.md "「VHDL で書くマージソーター(ソーティングネットワーク)」"
[「バイトニックマージソート」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/05_bitonic_sorter.md "「VHDL で書くマージソーター(バイトニックマージソート)」"
[「バッチャー奇偶マージソート」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/06_oddeven_sorter.md "「VHDL で書くマージソーター(バッチャー奇偶マージソート)」"
[「シングルワード マージソート ノード」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/07_merge_sort_node_single.md "「VHDL で書くマージソーター(シングルワード マージソート ノード)」"
[「マルチワード マージソート ノード」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/08_merge_sort_node_multi.md "「VHDL で書くマージソーター(マルチワード マージソート ノード)」"
[「マージソート ツリー」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/09_merge_sort_tree.md "「VHDL で書くマージソーター(マージソート ツリー)」"
[「端数ワード処理」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/10_merge_sort_core_1.md "「VHDL で書くマージソーター(端数ワード処理)」"
[「ストリーム入力」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/11_merge_sort_core_2.md "「VHDL で書くマージソーター(ストリーム入力)」"
[「ストリームフィードバック」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/12_merge_sort_core_3.md "「VHDL で書くマージソーター(ストリームフィードバック)」"
[「ArgSort IP」]: https://github.com/ikwzm/Merge_Sorter/blob/1.3.0/doc/ja/13_argsort.md "「VHDL で書くマージソーター(ArgSort IP)」"
[「ArgSort-Ultra96」]: https://github.com/ikwzm/ArgSort-Ultra96/blob/1.2.1/doc/ja/argsort-ultra96.md "「VHDL で書くマージソーター(ArgSort-Ultra96)」"
[『ZynqMP ACP と AXI をつなぐアダプタ』 @Qiita]: https://qiita.com/ikwzm/items/302c28c18af8ca51388a "『ZynqMP ACP と AXI をつなぐアダプタ』 @Qiita"
[『UltraZed/Ultra96/Ultra96-V2/KV260 向け Debian GNU/Linux (v2021.1版) ブートイメージの提供』@Qiita]: https://qiita.com/ikwzm/items/a9adc5a7329b2eb36895 "『UltraZed/Ultra96/Ultra96-V2/KV260 向け Debian GNU/Linux (v2021.1版) ブートイメージの提供』@Qiita"
[ArgSort_AXI IP 1.2]: https://github.com/ikwzm/ArgSort-Kv260/tree/1.2.0/ip/argsort_axi_1.2 "ArgSort_AXI IP 1.2"
[ZynqMP-ACP-Adapter]: https://github.com/ikwzm/ZynqMP-ACP-Adapter/ "ZynqMP-ACP-Adapter"
[ZynqMP-ACP-Adapter IP v0.4]: https://github.com/ikwzm/ZynqMP-ACP-Adapter/tree/v0.4 "ZynqMP-ACP-Adapter IP v0.4"
[ZynqMP-FPGA-Linux v2021.1.1]: https://github.com/ikwzm/ZynqMP-FPGA-Linux/tree/v2021.1.1 "ZynqMP-FPGA-Linux v2021.1.1"
[Xilinx Kria Kv260 Vision AI Starter Kit]: https://japan.xilinx.com/products/som/kria/kv260-vision-starter-kit.html "Xilinx Kria Kv260 Vision AI Starter Kit"

