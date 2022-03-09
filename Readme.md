ArgSorter for Kv260
====================================================================================

Overvier
------------------------------------------------------------------------------------

### Requirement

* Board: any of the following
  - Kv260
* OS: any of the following
  - https://github.com/ikwzm/ZynqMP-FPGA-Linux
  - https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04

### Licensing

Distributed under the BSD 2-Clause License.

Quick Start
------------------------------------------------------------------------------------

### Install

#### Install ZynqMP-FPGA-Linux or ZynqMP-FPGA-Ubuntu20.04

See https://github.com/ikwzm/ZynqMP-FPGA-Linux or https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04

#### Boot Kv260

#### Login fpga user

#### Download ArgSort-Kv260 to Kv260

```console
fpga@debian-fpga:~/$ git clone --branch 1.2.0 git://github.com/ikwzm/ArgSort-Kv260.git
fpga@debian-fpga:~/$ cd ArgSort-Kv260
```
Build Bitstream file
------------------------------------------------------------------------------------

### Requirement

* Xilinx Vivado 2021.2

### Download ArgSort-Kv260

```console
shell$ git clone --branch 1.2.0 git://github.com/ikwzm/ArgSort-Kv260.git
shell$ cd ArgSort-Kv260
shell$ git submodule update --init --recursive
```

### Build argsort_16_2_2.bin

#### Create Project

```
Vivado > Tools > Run Tcl Script... > argsort_16_2_2/create_project.tcl
```

#### Implementation

```
Vivado > Tools > Run Tcl Script... > argsort_16_2_2/implementation.tcl
```

#### Convert from Bitstream File to Binary File

```console
vivado% cd argsort_16_2_2
vivado% bootgen -image design_1.bif -arch zynqmp -w -o ../argsort_16_2_2.bin
vivado% cd ..
```

#### Compress argsort_16_2_2.bin to argsort_16_2_2.bin.gz

```console
vivado% gzip argsort_16_2_2.bin
```

Behavioral Simulation with GHDL
------------------------------------------------------------------------------------

### Requirement

* GHDL 0.35 or later

### Download ArgSort-Kv260

```console
shell$ git clone git://github.com/ikwzm/ArgSort-Kv260.git
shell$ cd ArgSort-Kv260
shell$ git submodule update --init --recursive
```

### Compile Dummy_Plug

```console
shell$ cd Merge_Sorter/Dummy_Plug/sim/ghdl-0.35/dummy_plug/
shell$ make
```

### Compile PipeWork and Merge_Sorter

```console
shell$ cd sim/ghdl
shell$ make dut
../../Merge_Sorter/PipeWork/tools/vhdl-archiver.rb \
            --library MERGE_SORTER \
            --archive merge_sorter.vhd \
            ../../ip/argsort_axi_0.8//src/MERGE_SORTER/
/mnt/d/ichiro/work/ArgSort-Kv260/Merge_Sorter/PipeWork/tools/lib/pipework/vhdl-reader.rb:149: warning: constant ::FALSE is deprecated
/mnt/d/ichiro/work/ArgSort-Kv260/Merge_Sorter/PipeWork/tools/lib/pipework/vhdl-reader.rb:159: warning: constant ::TRUE is deprecated
/mnt/d/ichiro/work/ArgSort-Kv260/Merge_Sorter/PipeWork/tools/lib/pipework/vhdl-reader.rb:155: warning: constant ::TRUE is deprecated
../../Merge_Sorter/PipeWork/tools/vhdl-archiver.rb \
            --library PIPEWORK \
            --use_entity 'SDPRAM(MODEL)' \
            --archive    pipework.vhd \
            ../../ip/argsort_axi_0.8//src/PIPEWORK/
/mnt/d/ichiro/work/ArgSort-Kv260/Merge_Sorter/PipeWork/tools/lib/pipework/vhdl-reader.rb:149: warning: constant ::FALSE is deprecated
/mnt/d/ichiro/work/ArgSort-Kv260/Merge_Sorter/PipeWork/tools/lib/pipework/vhdl-reader.rb:159: warning: constant ::TRUE is deprecated
/mnt/d/ichiro/work/ArgSort-Kv260/Merge_Sorter/PipeWork/tools/lib/pipework/vhdl-reader.rb:155: warning: constant ::TRUE is deprecated
ghdl -a --mb-comments -P../../Merge_Sorter/Dummy_Plug/sim/ghdl-0.35/dummy_plug -P./ --work=PIPEWORK pipework.vhd
pipework.vhd:11179:23:warning: declaration of "data_width" hides constant "data_width" [-Whide]
pipework.vhd:13247:18:warning: declaration of "req_queue_empty" hides signal "req_queue_empty" [-Whide]
pipework.vhd:17776:18:warning: declaration of "size" hides process labeled "size" [-Whide]
pipework.vhd:17820:16:warning: declaration of "xfer_last" hides port "xfer_last" [-Whide]
pipework.vhd:27457:15:warning: declaration of "queue_tree_arbiter" hides entity "queue_tree_arbiter" [-Whide]
pipework.vhd:27540:13:warning: declaration of "arb" hides component instance "arb" [-Whide]
pipework.vhd:28081:18:warning: declaration of "i_val" hides port "i_val" [-Whide]
pipework.vhd:28163:18:warning: declaration of "i_val" hides port "i_val" [-Whide]
ghdl -a --mb-comments -P../../Merge_Sorter/Dummy_Plug/sim/ghdl-0.35/dummy_plug -P./ --work=MERGE_SORTER merge_sorter.vhd
merge_sorter.vhd:6977:23:warning: declaration of "outlet_last" hides port "outlet_last" [-Whide]
merge_sorter.vhd:7532:19:warning: declaration of "o_word" hides port "o_word" [-Whide]
merge_sorter.vhd:10846:9:warning: declaration of "req" hides block statement labeled "req" [-Whide]
merge_sorter.vhd:10851:23:warning: declaration of "req_last" hides port "req_last" [-Whide]
merge_sorter.vhd:12229:23:warning: declaration of "state_type" hides type "state_type" [-Whide]
merge_sorter.vhd:12230:23:warning: declaration of "curr_state" hides signal "curr_state" [-Whide]
merge_sorter.vhd:12480:16:warning: declaration of "merge_sorter_tree" hides entity "merge_sorter_tree" [-Whide]
merge_sorter.vhd:13452:32:warning: declaration of "a_word" hides port "a_word" [-Whide]
merge_sorter.vhd:13452:40:warning: declaration of "b_word" hides port "b_word" [-Whide]
merge_sorter.vhd:13467:30:warning: declaration of "a_word" hides port "a_word" [-Whide]
merge_sorter.vhd:13467:38:warning: declaration of "b_word" hides port "b_word" [-Whide]
```

### Run Test Bench

```console
shell$ cd sim/ghdl
shell$ make
ghdl -a --mb-comments -P../../Merge_Sorter/Dummy_Plug/sim/ghdl-0.35/dummy_plug -P./ --work=MERGE_SORTER ../../Merge_Sorter/src/test/vhdl/argsort_axi_test_bench.vhd
ghdl -e --mb-comments -P../../Merge_Sorter/Dummy_Plug/sim/ghdl-0.35/dummy_plug -P./ --work=MERGE_SORTER ArgSort_AXI_Test_Bench_X16_W1_F2
ghdl -r --mb-comments -P../../Merge_Sorter/Dummy_Plug/sim/ghdl-0.35/dummy_plug -P./ --work=MERGE_SORTER ArgSort_AXI_Test_Bench_X16_W1_F2
        35 ns| MARCHAL < ArgSort_AXI_Test TEST 1 Start.
        55 ns| MARCHAL < ArgSort_AXI_Test TEST 1.1 Start.
      1705 ns| MARCHAL < ArgSort_AXI_Test TEST 1.1 Done.
           :
	   :
	   :
   3243505 ns| MARCHAL < ArgSort_AXI_Test TEST 3.20 SIZE=479 Start.
   3370415 ns| MARCHAL < ArgSort_AXI_Test TEST 3.20 SIZE=479 Done.
   3370435 ns| MARCHAL < ArgSort_AXI_Test TEST 3 Done.
  ***  
  ***  ERROR REPORT TEST_X16_W1_F2
  ***  
  ***  [ CSR ]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***  
  ***  [ STM AXI]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***  
  ***  [ MRG AXI]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***  
../../Merge_Sorter/src/test/vhdl/argsort_axi_test_bench.vhd:875:13:@3370456ns:(assertion note): Simulation complete(success).
```

Behavioral Simulation with Vivado
------------------------------------------------------------------------------------

### Requirement

* Xilinx Vivado 2019.2

### Download ArgSort-Kv260

```console
shell$ git clone git://github.com/ikwzm/ArgSort-Kv260.git
shell$ cd ArgSort-Kv260
shell$ git submodule update --init --recursive
```

### Create Project

```
Vivado > Tools > Run Tcl Script... > sim/vivado/create_project.tcl
```

### Run Behavioral Simulation

```
Vivado > File > Project > Open... > sim/vivado/argsort_axi.xpr
Vivado > Flow Navigator > Run Simulation > Run Behavioral Simulation
```

