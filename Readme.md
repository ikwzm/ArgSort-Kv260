ArgSorter for Kv260 (vivado-2021.2-abnormal-program-termination)
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


Design
------------------------------------------------------------------------------------

### Design Block

![Fig.1 ArgSort-Kv260 Design Block](./doc/ja/argsort-kv260-bd.png "Fig.1 ArgSort-Kv260 Design Block")

Fig.1 ArgSort-Kv260 Design Block

<br />

Build Bitstream file (but abnormal program termination)
------------------------------------------------------------------------------------

### Requirement

* Xilinx Vivado 2021.2

### Download ArgSort-Kv260

```console
shell$ git clone --branch vivado-2021.2-abnormal-program-termination https://github.com/ikwzm/ArgSort-Kv260.git ArgSort-Kv260-Vivado-Abort
shell$ cd ArgSort-Kv260-Vivado-Abort
shell$ git submodule update --init --recursive
```

### Setup Vivado

```console
shell$ source $VIVADO_INSTALLED_PATH/settings64.sh
```

### Build argsort_16_2_0.bin

#### Create Project

```console
shell$ cd argsort_16_2_0
shell$ make project
cp ../argsort_template//create_project.tcl  create_project.tcl
cp ../argsort_template//implementation.tcl  implementation.tcl
cp ../argsort_template//add_fan_enable.tcl  add_fan_enable.tcl
cp ../argsort_template//design_1_pin.xdc  design_1_pin.xdc
cp ../argsort_template//design_1.bif  design_1.bif
sed -e 's/\(.*CONFIG.MRG_WAYS\).*/\1 {16} \\/'         \
               -e 's/\(.*CONFIG.MRG_WORDS\).*/\1 {2} \\/'       \
               -e 's/\(.*CONFIG.STM_FEEDBACK\).*/\1 {0} \\/' \
               ../argsort_template//design_1_bd_2021.2.tcl > design_1_bd_2021.2.tcl
vivado -mode batch -source create_project.tcl

****** Vivado v2021.2 (64-bit)
  **** SW Build 3367213 on Tue Oct 19 02:47:39 MDT 2021
  **** IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
    ** Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

source create_project.tcl
# set project_directory       [file dirname [info script]]
# set project_name            "project"
# set board_part              [get_board_parts -quiet -latest_file_version "*kv260*"]
# lappend constrs_file_list   [file join $project_directory "design_1_pin.xdc" ]
# lappend ip_repo_path_list   [file join $project_directory ".." "ip"]
# lappend ip_repo_path_list   [file join $project_directory ".." "ZynqMP-ACP-Adapter" "ip"]
# set design_bd_tcl_file      [file join $project_directory "design_1_bd_2021.2.tcl"  ]
# if {[info exists project_name     ] == 0} {
#     set project_name        "project"
# }
# if {[info exists project_directory] == 0} {
#     set project_directory   [pwd]
# }
# cd $project_directory
# create_project -force $project_name $project_directory
# if       {[info exists board_part ] && [string equal $board_part  "" ] == 0} {
#     set_property "board_part"     $board_part      [current_project]
# } elseif {[info exists device_part] && [string equal $device_part "" ] == 0} {
#     set_property "part"           $device_part     [current_project]
# } else {
#     puts "ERROR: Please set board_part or device_part."
#     return 1
# }
WARNING: [Project 1-153] The current project device 'xc7k70tfbv676-1' does not match with the device on the 'XILINX.COM:KV260_SOM:PART0:1.2' board part. A device change to match the device on 'XILINX.COM:KV260_SOM:PART0:1.2' board part is being done. Please upgrade the IP in the project via the upgrade_ip command or by selecting Reports => Reports IP Status.
INFO: [Project 1-152] Project part set to zynquplus (xck26-sfvc784-2lv-c)
# set_property "default_lib"        "xil_defaultlib" [current_project]
# set_property "simulator_language" "Mixed"          [current_project]
# set_property "target_language"    "VHDL"           [current_project]
# if {[string equal [get_filesets -quiet sources_1] ""]} {
#     create_fileset -srcset sources_1
# }
# if {[string equal [get_filesets -quiet constrs_1] ""]} {
#     create_fileset -constrset constrs_1
# }
# if {[string equal [get_filesets -quiet sim_1] ""]} {
#     create_fileset -simset sim_1
# }
# set synth_1_flow     "Vivado Synthesis 2020"
# set synth_1_strategy "Vivado Synthesis Defaults"
# if {[string equal [get_runs -quiet synth_1] ""]} {
#     create_run -name synth_1 -flow $synth_1_flow -strategy $synth_1_strategy -constrset constrs_1
# } else {
#     set_property flow     $synth_1_flow     [get_runs synth_1]
#     set_property strategy $synth_1_strategy [get_runs synth_1]
# }
# current_run -synthesis [get_runs synth_1]
# set impl_1_flow      "Vivado Implementation 2020"
# set impl_1_strategy  "Vivado Implementation Defaults"
# if {[string equal [get_runs -quiet impl_1] ""]} {
#     create_run -name impl_1 -flow $impl_1_flow -strategy $impl_1_strategy -constrset constrs_1 -parent_run synth_1
# } else {
#     set_property flow     $impl_1_flow      [get_runs impl_1]
#     set_property strategy $impl_1_strategy  [get_runs impl_1]
# }
# current_run -implementation [get_runs impl_1]
# if {[info exists ip_repo_path_list] && [llength $ip_repo_path_list] > 0 } {
#     set_property ip_repo_paths $ip_repo_path_list [current_fileset]
#     update_ip_catalog
# }
INFO: [IP_Flow 19-234] Refreshing IP repositories
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ip'.
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ZynqMP-ACP-Adapter/ip'.
INFO: [IP_Flow 19-2313] Loaded Vivado IP repository '/home/ichiro/Xilinx/Vivado/2021.2/data/ip'.
# if {[info exists design_bd_tcl_file]} {
#     # 
#     # Read block design file
#     #
#     source $design_bd_tcl_file
#     #
#     # Save block design
#     #
#     regenerate_bd_layout
#     save_bd_design
#     #
#     # Generate wrapper files
#     #
#     set design_bd_name  [get_bd_designs]
#     make_wrapper -files [get_files $design_bd_name.bd] -top -import
# }
## namespace eval _tcl {
## proc get_script_folder {} {
##    set script_path [file normalize [info script]]
##    set script_folder [file dirname $script_path]
##    return $script_folder
## }
## }
## variable script_folder
## set script_folder [_tcl::get_script_folder]
## set scripts_vivado_version 2021.2
## set current_vivado_version [version -short]
## if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
##    puts ""
##    catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}
## 
##    return 1
## }
## set list_projs [get_projects -quiet]
## if { $list_projs eq "" } {
##    create_project project_1 myproj -part xck26-sfvc784-2LV-c
##    set_property BOARD_PART xilinx.com:kv260_som:part0:1.2 [current_project]
## }
## variable design_name
## set design_name design_1
## set errMsg ""
## set nRet 0
## set cur_design [current_bd_design -quiet]
## set list_cells [get_bd_cells -quiet]
## if { ${design_name} eq "" } {
##    # USE CASES:
##    #    1) Design_name not set
## 
##    set errMsg "Please set the variable <design_name> to a non-empty value."
##    set nRet 1
## 
## } elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
##    # USE CASES:
##    #    2): Current design opened AND is empty AND names same.
##    #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
##    #    4): Current design opened AND is empty AND names diff; design_name exists in project.
## 
##    if { $cur_design ne $design_name } {
##       common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
##       set design_name [get_property NAME $cur_design]
##    }
##    common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."
## 
## } elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
##    # USE CASES:
##    #    5) Current design opened AND has components AND same names.
## 
##    set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
##    set nRet 1
## } elseif { [get_files -quiet ${design_name}.bd] ne "" } {
##    # USE CASES: 
##    #    6) Current opened design, has components, but diff names, design_name exists in project.
##    #    7) No opened design, design_name exists in project.
## 
##    set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
##    set nRet 2
## 
## } else {
##    # USE CASES:
##    #    8) No opened design, design_name not in project.
##    #    9) Current opened design, has components, but diff names, design_name not in project.
## 
##    common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."
## 
##    create_bd_design $design_name
## 
##    common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
##    current_bd_design $design_name
## 
## }
INFO: [BD::TCL 103-2003] Currently there is no design <design_1> in project, so creating one...
Wrote  : </mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.srcs/sources_1/bd/design_1/design_1.bd> 
INFO: [BD 41-2613] The output directory /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1 for design_1 cannot be found.
INFO: [BD::TCL 103-2004] Making design <design_1> as current_bd_design.
## common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."
INFO: [BD::TCL 103-2005] Currently the variable <design_name> is equal to "design_1".
## if { $nRet != 0 } {
##    catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
##    return $nRet
## }
## set bCheckIPsPassed 1
## set bCheckIPs 1
## if { $bCheckIPs == 1 } {
##    set list_check_ips "\ 
## ikwzm:Merge_Sorter:ArgSort_AXI:1.5\
## ikwzm:PIPEORK:ZYNQMP_ACP_ADAPTER:0.8\
## xilinx.com:ip:clk_wiz:6.0\
## xilinx.com:ip:proc_sys_reset:5.0\
## xilinx.com:ip:zynq_ultra_ps_e:3.3\
## "
## 
##    set list_ips_missing ""
##    common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."
## 
##    foreach ip_vlnv $list_check_ips {
##       set ip_obj [get_ipdefs -all $ip_vlnv]
##       if { $ip_obj eq "" } {
##          lappend list_ips_missing $ip_vlnv
##       }
##    }
## 
##    if { $list_ips_missing ne "" } {
##       catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
##       set bCheckIPsPassed 0
##    }
## 
## }
INFO: [BD::TCL 103-2011] Checking if the following IPs exist in the project's IP catalog:  
ikwzm:Merge_Sorter:ArgSort_AXI:1.5 ikwzm:PIPEORK:ZYNQMP_ACP_ADAPTER:0.8 xilinx.com:ip:clk_wiz:6.0 xilinx.com:ip:proc_sys_reset:5.0 xilinx.com:ip:zynq_ultra_ps_e:3.3  .
## if { $bCheckIPsPassed != 1 } {
##   common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
##   return 3
## }
## source [file join $project_directory "add_fan_enable.tcl"  ]
### proc add_fan_enable { zynq_ultra_ps_e_0 port_name prefix} {
### 
###     variable slice_cell
###     variable cell_name
###     variable net_name_din
###     variable net_name_dout
### 
###     if { $port_name eq "" } {
###         set port_name FAN_EN
###     }
### 
###     if { $prefix eq "" } {
### 	set prefix ttc0
###     }
###     
###     append cell_name     $prefix    "_slice"
###     append net_name_din  $cell_name "_din"
###     append net_name_dout $cell_name "_dout"
### 
###     set_property -dict [list CONFIG.PSU__TTC0__WAVEOUT__ENABLE {1} ] $zynq_ultra_ps_e_0
###     set_property -dict [list CONFIG.PSU__TTC0__WAVEOUT__IO {EMIO}  ] $zynq_ultra_ps_e_0
### 
###     set slice_cell  [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 $cell_name ]
### 
###     set_property -dict [ list CONFIG.DIN_FROM {2} CONFIG.DIN_TO {2} CONFIG.DIN_WIDTH {3} ] $slice_cell
### 
###     create_bd_port -dir O -from 0 -to 0 $port_name
###     connect_bd_net -net $net_name_dout [get_bd_pins $slice_cell/Dout] [get_bd_ports $port_name] 
###     connect_bd_net -net $net_name_din  [get_bd_pins $slice_cell/Din ] [get_bd_pins $zynq_ultra_ps_e_0/emio_ttc0_wave_o]
### }
## proc create_root_design { parentCell } {
## 
##   variable script_folder
##   variable design_name
## 
##   if { $parentCell eq "" } {
##      set parentCell [get_bd_cells /]
##   }
## 
##   # Get object for parentCell
##   set parentObj [get_bd_cells $parentCell]
##   if { $parentObj == "" } {
##      catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
##      return
##   }
## 
##   # Make sure parentObj is hier blk
##   set parentType [get_property TYPE $parentObj]
##   if { $parentType ne "hier" } {
##      catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
##      return
##   }
## 
##   # Save current instance; Restore later
##   set oldCurInst [current_bd_instance .]
## 
##   # Set parent object as current
##   current_bd_instance $parentObj
## 
## 
##   # Create interface ports
## 
##   # Create ports
## 
##   # Create instance: ArgSort_AXI_1, and set properties
##   set ArgSort_AXI_1 [ create_bd_cell -type ip -vlnv ikwzm:Merge_Sorter:ArgSort_AXI:1.5 ArgSort_AXI_1 ]
##   set_property -dict [ list \
##    CONFIG.DEBUG_ENABLE {1} \
##    CONFIG.MRG_AXI_ADDR_WIDTH {64} \
##    CONFIG.MRG_AXI_DATA_WIDTH {128} \
##    CONFIG.MRG_AXI_ID_BASE {2} \
##    CONFIG.MRG_AXI_ID_WIDTH {2} \
##    CONFIG.MRG_AXI_USER_WIDTH {1} \
##    CONFIG.MRG_FIFO_SIZE {64} \
##    CONFIG.MRG_RD_ARB_PIPELINE {0} \
##    CONFIG.MRG_RD_AXI_XFER_SIZE {12} \
##    CONFIG.MRG_WAYS {16} \
##    CONFIG.MRG_WORDS {2} \
##    CONFIG.MRG_WR_AXI_XFER_SIZE {12} \
##    CONFIG.SORT_SIZE_BITS {28} \
##    CONFIG.STM_AXI_ADDR_WIDTH {64} \
##    CONFIG.STM_AXI_DATA_WIDTH {128} \
##    CONFIG.STM_AXI_ID_BASE {0} \
##    CONFIG.STM_AXI_ID_WIDTH {5} \
##    CONFIG.STM_AXI_USER_WIDTH {2} \
##    CONFIG.STM_FEEDBACK {0} \
##    CONFIG.STM_RD_AXI_XFER_SIZE {12} \
##    CONFIG.STM_WR_AXI_XFER_SIZE {12} \
##  ] $ArgSort_AXI_1
## 
##   # Create instance: ZYNQMP_ACP_ADAPTER_0, and set properties
##   set ZYNQMP_ACP_ADAPTER_0 [ create_bd_cell -type ip -vlnv ikwzm:PIPEORK:ZYNQMP_ACP_ADAPTER:0.8 ZYNQMP_ACP_ADAPTER_0 ]
##   set_property -dict [ list \
##    CONFIG.AXI_ID_WIDTH {5} \
##    CONFIG.AXI_AUSER_WIDTH {2} \
##    CONFIG.ARSHARE_TYPE {3} \
##    CONFIG.AWSHARE_TYPE {3} \
##  ] $ZYNQMP_ACP_ADAPTER_0
## 
##   # Create instance: axi_interconnect_0, and set properties
##   set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
##   set_property -dict [ list \
##    CONFIG.NUM_MI {1} \
##  ] $axi_interconnect_0
## 
##   # Create instance: clk_wiz_0, and set properties
##   set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
##   set_property -dict [ list \
##    CONFIG.CLKOUT1_DRIVES {Buffer} \
##    CONFIG.CLKOUT1_JITTER {110.210} \
##    CONFIG.CLKOUT1_PHASE_ERROR {98.576} \
##    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {250.000} \
##    CONFIG.CLKOUT2_DRIVES {Buffer} \
##    CONFIG.CLKOUT3_DRIVES {Buffer} \
##    CONFIG.CLKOUT4_DRIVES {Buffer} \
##    CONFIG.CLKOUT5_DRIVES {Buffer} \
##    CONFIG.CLKOUT6_DRIVES {Buffer} \
##    CONFIG.CLKOUT7_DRIVES {Buffer} \
##    CONFIG.MMCM_BANDWIDTH {OPTIMIZED} \
##    CONFIG.MMCM_CLKFBOUT_MULT_F {10} \
##    CONFIG.MMCM_CLKOUT0_DIVIDE_F {4} \
##    CONFIG.MMCM_COMPENSATION {AUTO} \
##    CONFIG.PRIMITIVE {PLL} \
##    CONFIG.RESET_PORT {resetn} \
##    CONFIG.RESET_TYPE {ACTIVE_LOW} \
##  ] $clk_wiz_0
## 
##   # Create instance: rst_ps8_0_99M, and set properties
##   set rst_ps8_0_99M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_0_99M ]
## 
##   # Create instance: zynq_ultra_ps_e_0, and set properties
##   set zynq_ultra_ps_e_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e_0 ]
##   set_property -dict [ list \
##    CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS18} \
##    CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS18} \
##    CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
##    CONFIG.PSU_BANK_3_IO_STANDARD {LVCMOS18} \
##    CONFIG.PSU_DDR_RAM_HIGHADDR {0xFFFFFFFF} \
##    CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x800000000} \
##    CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
##    CONFIG.PSU_DYNAMIC_DDR_CONFIG_EN {0} \
##    CONFIG.PSU_MIO_0_DIRECTION {out} \
##    CONFIG.PSU_MIO_0_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_0_INPUT_TYPE {cmos} \
##    CONFIG.PSU_MIO_0_POLARITY {Default} \
##    CONFIG.PSU_MIO_0_SLEW {slow} \
##    CONFIG.PSU_MIO_10_DIRECTION {inout} \
##    CONFIG.PSU_MIO_10_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_10_POLARITY {Default} \
##    CONFIG.PSU_MIO_10_SLEW {slow} \
##    CONFIG.PSU_MIO_11_DIRECTION {inout} \
##    CONFIG.PSU_MIO_11_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_11_POLARITY {Default} \
##    CONFIG.PSU_MIO_11_SLEW {slow} \
##    CONFIG.PSU_MIO_12_DIRECTION {inout} \
##    CONFIG.PSU_MIO_12_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_12_POLARITY {Default} \
##    CONFIG.PSU_MIO_12_SLEW {slow} \
##    CONFIG.PSU_MIO_13_DIRECTION {inout} \
##    CONFIG.PSU_MIO_13_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_13_POLARITY {Default} \
##    CONFIG.PSU_MIO_13_SLEW {slow} \
##    CONFIG.PSU_MIO_14_DIRECTION {inout} \
##    CONFIG.PSU_MIO_14_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_14_POLARITY {Default} \
##    CONFIG.PSU_MIO_14_SLEW {slow} \
##    CONFIG.PSU_MIO_15_DIRECTION {inout} \
##    CONFIG.PSU_MIO_15_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_15_POLARITY {Default} \
##    CONFIG.PSU_MIO_15_SLEW {slow} \
##    CONFIG.PSU_MIO_16_DIRECTION {inout} \
##    CONFIG.PSU_MIO_16_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_16_POLARITY {Default} \
##    CONFIG.PSU_MIO_16_SLEW {slow} \
##    CONFIG.PSU_MIO_17_DIRECTION {inout} \
##    CONFIG.PSU_MIO_17_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_17_POLARITY {Default} \
##    CONFIG.PSU_MIO_17_SLEW {slow} \
##    CONFIG.PSU_MIO_18_DIRECTION {inout} \
##    CONFIG.PSU_MIO_18_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_18_POLARITY {Default} \
##    CONFIG.PSU_MIO_18_SLEW {slow} \
##    CONFIG.PSU_MIO_19_DIRECTION {inout} \
##    CONFIG.PSU_MIO_19_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_19_POLARITY {Default} \
##    CONFIG.PSU_MIO_19_SLEW {slow} \
##    CONFIG.PSU_MIO_1_DIRECTION {inout} \
##    CONFIG.PSU_MIO_1_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_1_POLARITY {Default} \
##    CONFIG.PSU_MIO_1_SLEW {slow} \
##    CONFIG.PSU_MIO_20_DIRECTION {inout} \
##    CONFIG.PSU_MIO_20_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_20_POLARITY {Default} \
##    CONFIG.PSU_MIO_20_SLEW {slow} \
##    CONFIG.PSU_MIO_21_DIRECTION {inout} \
##    CONFIG.PSU_MIO_21_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_21_POLARITY {Default} \
##    CONFIG.PSU_MIO_21_SLEW {slow} \
##    CONFIG.PSU_MIO_22_DIRECTION {inout} \
##    CONFIG.PSU_MIO_22_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_22_POLARITY {Default} \
##    CONFIG.PSU_MIO_22_SLEW {slow} \
##    CONFIG.PSU_MIO_23_DIRECTION {inout} \
##    CONFIG.PSU_MIO_23_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_23_POLARITY {Default} \
##    CONFIG.PSU_MIO_23_SLEW {slow} \
##    CONFIG.PSU_MIO_24_DIRECTION {inout} \
##    CONFIG.PSU_MIO_24_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_24_POLARITY {Default} \
##    CONFIG.PSU_MIO_24_SLEW {slow} \
##    CONFIG.PSU_MIO_25_DIRECTION {inout} \
##    CONFIG.PSU_MIO_25_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_25_POLARITY {Default} \
##    CONFIG.PSU_MIO_25_SLEW {slow} \
##    CONFIG.PSU_MIO_26_DIRECTION {in} \
##    CONFIG.PSU_MIO_26_DRIVE_STRENGTH {12} \
##    CONFIG.PSU_MIO_26_POLARITY {Default} \
##    CONFIG.PSU_MIO_26_SLEW {fast} \
##    CONFIG.PSU_MIO_27_DIRECTION {inout} \
##    CONFIG.PSU_MIO_27_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_27_POLARITY {Default} \
##    CONFIG.PSU_MIO_27_SLEW {slow} \
##    CONFIG.PSU_MIO_28_DIRECTION {inout} \
##    CONFIG.PSU_MIO_28_POLARITY {Default} \
##    CONFIG.PSU_MIO_29_DIRECTION {inout} \
##    CONFIG.PSU_MIO_29_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_29_POLARITY {Default} \
##    CONFIG.PSU_MIO_29_SLEW {slow} \
##    CONFIG.PSU_MIO_2_DIRECTION {inout} \
##    CONFIG.PSU_MIO_2_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_2_POLARITY {Default} \
##    CONFIG.PSU_MIO_2_SLEW {slow} \
##    CONFIG.PSU_MIO_30_DIRECTION {inout} \
##    CONFIG.PSU_MIO_30_DRIVE_STRENGTH {12} \
##    CONFIG.PSU_MIO_30_POLARITY {Default} \
##    CONFIG.PSU_MIO_30_SLEW {fast} \
##    CONFIG.PSU_MIO_31_DIRECTION {in} \
##    CONFIG.PSU_MIO_31_DRIVE_STRENGTH {12} \
##    CONFIG.PSU_MIO_31_POLARITY {Default} \
##    CONFIG.PSU_MIO_31_SLEW {fast} \
##    CONFIG.PSU_MIO_32_DIRECTION {out} \
##    CONFIG.PSU_MIO_32_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_32_INPUT_TYPE {cmos} \
##    CONFIG.PSU_MIO_32_POLARITY {Default} \
##    CONFIG.PSU_MIO_32_SLEW {slow} \
##    CONFIG.PSU_MIO_33_DIRECTION {out} \
##    CONFIG.PSU_MIO_33_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_33_INPUT_TYPE {cmos} \
##    CONFIG.PSU_MIO_33_POLARITY {Default} \
##    CONFIG.PSU_MIO_33_SLEW {slow} \
##    CONFIG.PSU_MIO_34_DIRECTION {out} \
##    CONFIG.PSU_MIO_34_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_34_INPUT_TYPE {cmos} \
##    CONFIG.PSU_MIO_34_POLARITY {Default} \
##    CONFIG.PSU_MIO_34_SLEW {slow} \
##    CONFIG.PSU_MIO_35_DIRECTION {out} \
##    CONFIG.PSU_MIO_35_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_35_INPUT_TYPE {cmos} \
##    CONFIG.PSU_MIO_35_POLARITY {Default} \
##    CONFIG.PSU_MIO_35_SLEW {slow} \
##    CONFIG.PSU_MIO_36_DIRECTION {inout} \
##    CONFIG.PSU_MIO_36_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_36_POLARITY {Default} \
##    CONFIG.PSU_MIO_36_SLEW {slow} \
##    CONFIG.PSU_MIO_37_DIRECTION {inout} \
##    CONFIG.PSU_MIO_37_POLARITY {Default} \
##    CONFIG.PSU_MIO_38_DIRECTION {inout} \
##    CONFIG.PSU_MIO_38_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_38_POLARITY {Default} \
##    CONFIG.PSU_MIO_38_SLEW {slow} \
##    CONFIG.PSU_MIO_39_DIRECTION {inout} \
##    CONFIG.PSU_MIO_39_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_39_POLARITY {Default} \
##    CONFIG.PSU_MIO_39_SLEW {slow} \
##    CONFIG.PSU_MIO_3_DIRECTION {inout} \
##    CONFIG.PSU_MIO_3_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_3_POLARITY {Default} \
##    CONFIG.PSU_MIO_3_SLEW {slow} \
##    CONFIG.PSU_MIO_40_DIRECTION {inout} \
##    CONFIG.PSU_MIO_40_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_40_POLARITY {Default} \
##    CONFIG.PSU_MIO_40_SLEW {slow} \
##    CONFIG.PSU_MIO_41_DIRECTION {inout} \
##    CONFIG.PSU_MIO_41_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_41_POLARITY {Default} \
##    CONFIG.PSU_MIO_41_SLEW {slow} \
##    CONFIG.PSU_MIO_42_DIRECTION {inout} \
##    CONFIG.PSU_MIO_42_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_42_POLARITY {Default} \
##    CONFIG.PSU_MIO_42_SLEW {slow} \
##    CONFIG.PSU_MIO_43_DIRECTION {inout} \
##    CONFIG.PSU_MIO_43_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_43_POLARITY {Default} \
##    CONFIG.PSU_MIO_43_SLEW {slow} \
##    CONFIG.PSU_MIO_44_DIRECTION {inout} \
##    CONFIG.PSU_MIO_44_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_44_POLARITY {Default} \
##    CONFIG.PSU_MIO_44_SLEW {slow} \
##    CONFIG.PSU_MIO_45_DIRECTION {inout} \
##    CONFIG.PSU_MIO_45_POLARITY {Default} \
##    CONFIG.PSU_MIO_46_DIRECTION {inout} \
##    CONFIG.PSU_MIO_46_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_46_POLARITY {Default} \
##    CONFIG.PSU_MIO_46_SLEW {slow} \
##    CONFIG.PSU_MIO_47_DIRECTION {inout} \
##    CONFIG.PSU_MIO_47_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_47_POLARITY {Default} \
##    CONFIG.PSU_MIO_47_SLEW {slow} \
##    CONFIG.PSU_MIO_48_DIRECTION {inout} \
##    CONFIG.PSU_MIO_48_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_48_POLARITY {Default} \
##    CONFIG.PSU_MIO_48_SLEW {slow} \
##    CONFIG.PSU_MIO_49_DIRECTION {inout} \
##    CONFIG.PSU_MIO_49_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_49_POLARITY {Default} \
##    CONFIG.PSU_MIO_49_SLEW {slow} \
##    CONFIG.PSU_MIO_4_DIRECTION {inout} \
##    CONFIG.PSU_MIO_4_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_4_POLARITY {Default} \
##    CONFIG.PSU_MIO_4_SLEW {slow} \
##    CONFIG.PSU_MIO_50_DIRECTION {inout} \
##    CONFIG.PSU_MIO_50_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_50_POLARITY {Default} \
##    CONFIG.PSU_MIO_50_SLEW {slow} \
##    CONFIG.PSU_MIO_51_DIRECTION {inout} \
##    CONFIG.PSU_MIO_51_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_51_POLARITY {Default} \
##    CONFIG.PSU_MIO_51_SLEW {slow} \
##    CONFIG.PSU_MIO_54_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_54_SLEW {slow} \
##    CONFIG.PSU_MIO_56_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_56_SLEW {slow} \
##    CONFIG.PSU_MIO_57_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_57_SLEW {slow} \
##    CONFIG.PSU_MIO_58_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_58_SLEW {slow} \
##    CONFIG.PSU_MIO_59_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_59_SLEW {slow} \
##    CONFIG.PSU_MIO_5_DIRECTION {out} \
##    CONFIG.PSU_MIO_5_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_5_INPUT_TYPE {cmos} \
##    CONFIG.PSU_MIO_5_POLARITY {Default} \
##    CONFIG.PSU_MIO_5_SLEW {slow} \
##    CONFIG.PSU_MIO_60_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_60_SLEW {slow} \
##    CONFIG.PSU_MIO_61_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_61_SLEW {slow} \
##    CONFIG.PSU_MIO_62_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_62_SLEW {slow} \
##    CONFIG.PSU_MIO_63_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_63_SLEW {slow} \
##    CONFIG.PSU_MIO_64_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_64_SLEW {slow} \
##    CONFIG.PSU_MIO_65_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_65_SLEW {slow} \
##    CONFIG.PSU_MIO_66_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_66_SLEW {slow} \
##    CONFIG.PSU_MIO_67_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_67_SLEW {slow} \
##    CONFIG.PSU_MIO_68_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_68_SLEW {slow} \
##    CONFIG.PSU_MIO_69_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_69_SLEW {slow} \
##    CONFIG.PSU_MIO_6_DIRECTION {inout} \
##    CONFIG.PSU_MIO_6_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_6_POLARITY {Default} \
##    CONFIG.PSU_MIO_6_SLEW {slow} \
##    CONFIG.PSU_MIO_76_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_76_SLEW {slow} \
##    CONFIG.PSU_MIO_77_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_77_SLEW {slow} \
##    CONFIG.PSU_MIO_7_DIRECTION {inout} \
##    CONFIG.PSU_MIO_7_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_7_POLARITY {Default} \
##    CONFIG.PSU_MIO_7_SLEW {slow} \
##    CONFIG.PSU_MIO_8_DIRECTION {inout} \
##    CONFIG.PSU_MIO_8_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_8_POLARITY {Default} \
##    CONFIG.PSU_MIO_8_SLEW {slow} \
##    CONFIG.PSU_MIO_9_DIRECTION {inout} \
##    CONFIG.PSU_MIO_9_DRIVE_STRENGTH {4} \
##    CONFIG.PSU_MIO_9_POLARITY {Default} \
##    CONFIG.PSU_MIO_9_SLEW {slow} \
##    CONFIG.PSU_MIO_TREE_PERIPHERALS {\
## Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad\
## SPI Flash#SPI 1#GPIO0 MIO#GPIO0 MIO#SPI 1#SPI 1#SPI 1#GPIO0 MIO#GPIO0 MIO#GPIO0\
## MIO#GPIO0 MIO#GPIO0 MIO#GPIO0 MIO#GPIO0 MIO#GPIO0 MIO#GPIO0 MIO#GPIO0 MIO#GPIO0\
## MIO#GPIO0 MIO#I2C 1#I2C 1#PMU GPI 0#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#PMU\
## GPI 5#PMU GPO 0#PMU GPO 1#PMU GPO 2#PMU GPO 3#GPIO1 MIO#GPIO1 MIO#GPIO1\
## MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1\
## MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO##########################} \
##    CONFIG.PSU_MIO_TREE_SIGNALS {\
## sclk_out#miso_mo1#mo2#mo3#mosi_mi0#n_ss_out#sclk_out#gpio0[7]#gpio0[8]#n_ss_out[0]#miso#mosi#gpio0[12]#gpio0[13]#gpio0[14]#gpio0[15]#gpio0[16]#gpio0[17]#gpio0[18]#gpio0[19]#gpio0[20]#gpio0[21]#gpio0[22]#gpio0[23]#scl_out#sda_out#gpi[0]#gpio1[27]#gpio1[28]#gpio1[29]#gpio1[30]#gpi[5]#gpo[0]#gpo[1]#gpo[2]#gpo[3]#gpio1[36]#gpio1[37]#gpio1[38]#gpio1[39]#gpio1[40]#gpio1[41]#gpio1[42]#gpio1[43]#gpio1[44]#gpio1[45]#gpio1[46]#gpio1[47]#gpio1[48]#gpio1[49]#gpio1[50]#gpio1[51]##########################} \
##    CONFIG.PSU__ACT_DDR_FREQ_MHZ {1066.656006} \
##    CONFIG.PSU__CAN1__GRP_CLK__ENABLE {0} \
##    CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {0} \
##    CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1333.333008} \
##    CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
##    CONFIG.PSU__CRF_APB__ACPU_CTRL__FREQMHZ {1333.333} \
##    CONFIG.PSU__CRF_APB__ACPU_CTRL__SRCSEL {APLL} \
##    CONFIG.PSU__CRF_APB__ACPU__FRAC_ENABLED {1} \
##    CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
##    CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {80} \
##    CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0.000778} \
##    CONFIG.PSU__CRF_APB__APLL_CTRL__FRACFREQ {1333.333} \
##    CONFIG.PSU__CRF_APB__APLL_CTRL__SRCSEL {PSS_REF_CLK} \
##    CONFIG.PSU__CRF_APB__APLL_FRAC_CFG__ENABLED {1} \
##    CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
##    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {249.997498} \
##    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5} \
##    CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {249.997498} \
##    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {533.328003} \
##    CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {1200} \
##    CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {DPLL} \
##    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {444.444336} \
##    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {3} \
##    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__FREQMHZ {600} \
##    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__SRCSEL {APLL} \
##    CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
##    CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {64} \
##    CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0.000000} \
##    CONFIG.PSU__CRF_APB__DPLL_CTRL__SRCSEL {PSS_REF_CLK} \
##    CONFIG.PSU__CRF_APB__DPLL_FRAC_CFG__ENABLED {0} \
##    CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {63} \
##    CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {RPLL} \
##    CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {6} \
##    CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {10} \
##    CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL} \
##    CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {5} \
##    CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL} \
##    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {533.328003} \
##    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__FREQMHZ {600} \
##    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__SRCSEL {DPLL} \
##    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__ACT_FREQMHZ {499.994995} \
##    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {1} \
##    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__FREQMHZ {600} \
##    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {6} \
##    CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {5} \
##    CONFIG.PSU__CRF_APB__SATA_REF_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRF_APB__SATA_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
##    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {533.328003} \
##    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__FREQMHZ {533.33} \
##    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {DPLL} \
##    CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
##    CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {90} \
##    CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.000000} \
##    CONFIG.PSU__CRF_APB__VPLL_CTRL__SRCSEL {PSS_REF_CLK} \
##    CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {0} \
##    CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {3} \
##    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {499.994995} \
##    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__FREQMHZ {500} \
##    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3} \
##    CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {49.999500} \
##    CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {20} \
##    CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
##    CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
##    CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {533.328003} \
##    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__FREQMHZ {533.333} \
##    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL {RPLL} \
##    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {249.997498} \
##    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {4} \
##    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {999.989990} \
##    CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
##    CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
##    CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
##    CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
##    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__FREQMHZ {125} \
##    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {4} \
##    CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
##    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {10} \
##    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1} \
##    CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {60} \
##    CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0.000000} \
##    CONFIG.PSU__CRL_APB__IOPLL_CTRL__SRCSEL {PSS_REF_CLK} \
##    CONFIG.PSU__CRL_APB__IOPLL_FRAC_CFG__ENABLED {0} \
##    CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {249.997498} \
##    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {4} \
##    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {10} \
##    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {499.994995} \
##    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__FREQMHZ {500} \
##    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
##    CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {199.998001} \
##    CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {5} \
##    CONFIG.PSU__CRL_APB__PCAP_CTRL__FREQMHZ {200} \
##    CONFIG.PSU__CRL_APB__PCAP_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {10} \
##    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {4} \
##    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__SRCSEL {RPLL} \
##    CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {4} \
##    CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4} \
##    CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__ACT_FREQMHZ {124.998749} \
##    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {8} \
##    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {125} \
##    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
##    CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {64} \
##    CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0.000000} \
##    CONFIG.PSU__CRL_APB__RPLL_CTRL__SRCSEL {PSS_REF_CLK} \
##    CONFIG.PSU__CRL_APB__RPLL_FRAC_CFG__ENABLED {0} \
##    CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {2} \
##    CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {7} \
##    CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {7} \
##    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__FREQMHZ {200} \
##    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {7} \
##    CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__ACT_FREQMHZ {199.998001} \
##    CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {5} \
##    CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {10} \
##    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
##    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
##    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__FREQMHZ {100} \
##    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
##    CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__FREQMHZ {250} \
##    CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
##    CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
##    CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {5} \
##    CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {15} \
##    CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__FREQMHZ {20} \
##    CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__SRCSEL {IOPLL} \
##    CONFIG.PSU__CSUPMU__PERIPHERAL__VALID {1} \
##    CONFIG.PSU__DDRC__ADDR_MIRROR {0} \
##    CONFIG.PSU__DDRC__BANK_ADDR_COUNT {2} \
##    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
##    CONFIG.PSU__DDRC__BRC_MAPPING {ROW_BANK_COL} \
##    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
##    CONFIG.PSU__DDRC__CL {16} \
##    CONFIG.PSU__DDRC__CLOCK_STOP_EN {0} \
##    CONFIG.PSU__DDRC__COL_ADDR_COUNT {10} \
##    CONFIG.PSU__DDRC__COMPONENTS {Components} \
##    CONFIG.PSU__DDRC__CWL {14} \
##    CONFIG.PSU__DDRC__DDR3L_T_REF_RANGE {NA} \
##    CONFIG.PSU__DDRC__DDR3_T_REF_RANGE {NA} \
##    CONFIG.PSU__DDRC__DDR4_ADDR_MAPPING {0} \
##    CONFIG.PSU__DDRC__DDR4_CAL_MODE_ENABLE {0} \
##    CONFIG.PSU__DDRC__DDR4_CRC_CONTROL {0} \
##    CONFIG.PSU__DDRC__DDR4_T_REF_MODE {0} \
##    CONFIG.PSU__DDRC__DDR4_T_REF_RANGE {Normal (0-85)} \
##    CONFIG.PSU__DDRC__DEEP_PWR_DOWN_EN {0} \
##    CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits} \
##    CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {0} \
##    CONFIG.PSU__DDRC__DM_DBI {DM_NO_DBI} \
##    CONFIG.PSU__DDRC__DQMAP_0_3 {0} \
##    CONFIG.PSU__DDRC__DQMAP_12_15 {0} \
##    CONFIG.PSU__DDRC__DQMAP_16_19 {0} \
##    CONFIG.PSU__DDRC__DQMAP_20_23 {0} \
##    CONFIG.PSU__DDRC__DQMAP_24_27 {0} \
##    CONFIG.PSU__DDRC__DQMAP_28_31 {0} \
##    CONFIG.PSU__DDRC__DQMAP_32_35 {0} \
##    CONFIG.PSU__DDRC__DQMAP_36_39 {0} \
##    CONFIG.PSU__DDRC__DQMAP_40_43 {0} \
##    CONFIG.PSU__DDRC__DQMAP_44_47 {0} \
##    CONFIG.PSU__DDRC__DQMAP_48_51 {0} \
##    CONFIG.PSU__DDRC__DQMAP_4_7 {0} \
##    CONFIG.PSU__DDRC__DQMAP_52_55 {0} \
##    CONFIG.PSU__DDRC__DQMAP_56_59 {0} \
##    CONFIG.PSU__DDRC__DQMAP_60_63 {0} \
##    CONFIG.PSU__DDRC__DQMAP_64_67 {0} \
##    CONFIG.PSU__DDRC__DQMAP_68_71 {0} \
##    CONFIG.PSU__DDRC__DQMAP_8_11 {0} \
##    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
##    CONFIG.PSU__DDRC__ECC {Disabled} \
##    CONFIG.PSU__DDRC__ENABLE_LP4_HAS_ECC_COMP {0} \
##    CONFIG.PSU__DDRC__ENABLE_LP4_SLOWBOOT {0} \
##    CONFIG.PSU__DDRC__FGRM {1X} \
##    CONFIG.PSU__DDRC__LPDDR3_T_REF_RANGE {NA} \
##    CONFIG.PSU__DDRC__LPDDR4_T_REF_RANGE {NA} \
##    CONFIG.PSU__DDRC__LP_ASR {manual normal} \
##    CONFIG.PSU__DDRC__MEMORY_TYPE {DDR 4} \
##    CONFIG.PSU__DDRC__PARITY_ENABLE {0} \
##    CONFIG.PSU__DDRC__PER_BANK_REFRESH {0} \
##    CONFIG.PSU__DDRC__PHY_DBI_MODE {0} \
##    CONFIG.PSU__DDRC__RANK_ADDR_COUNT {0} \
##    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16} \
##    CONFIG.PSU__DDRC__SB_TARGET {16-16-16} \
##    CONFIG.PSU__DDRC__SELF_REF_ABORT {0} \
##    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400R} \
##    CONFIG.PSU__DDRC__STATIC_RD_MODE {0} \
##    CONFIG.PSU__DDRC__TRAIN_DATA_EYE {1} \
##    CONFIG.PSU__DDRC__TRAIN_READ_GATE {1} \
##    CONFIG.PSU__DDRC__TRAIN_WRITE_LEVEL {1} \
##    CONFIG.PSU__DDRC__T_FAW {30.0} \
##    CONFIG.PSU__DDRC__T_RAS_MIN {33} \
##    CONFIG.PSU__DDRC__T_RC {47.06} \
##    CONFIG.PSU__DDRC__T_RCD {16} \
##    CONFIG.PSU__DDRC__T_RP {16} \
##    CONFIG.PSU__DDRC__VENDOR_PART {OTHERS} \
##    CONFIG.PSU__DDRC__VREF {1} \
##    CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {1} \
##    CONFIG.PSU__DDR__INTERFACE__FREQMHZ {600.000} \
##    CONFIG.PSU__DP__REF_CLK_FREQ {<Select>} \
##    CONFIG.PSU__DP__REF_CLK_SEL {<Select>} \
##    CONFIG.PSU__FPD_SLCR__WDT1__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__FPD_SLCR__WDT1__FREQMHZ {99.999001} \
##    CONFIG.PSU__FPD_SLCR__WDT_CLK_SEL__SELECT {APB} \
##    CONFIG.PSU__FPGA_PL0_ENABLE {1} \
##    CONFIG.PSU__FPGA_PL1_ENABLE {0} \
##    CONFIG.PSU__GPIO0_MIO__IO {MIO 0 .. 25} \
##    CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__GPIO1_MIO__IO {MIO 26 .. 51} \
##    CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__HIGH_ADDRESS__ENABLE {1} \
##    CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {0} \
##    CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__I2C1__PERIPHERAL__IO {MIO 24 .. 25} \
##    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC0_SEL {APB} \
##    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC1_SEL {APB} \
##    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC2_SEL {APB} \
##    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC3_SEL {APB} \
##    CONFIG.PSU__IOU_SLCR__TTC0__ACT_FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__TTC0__FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__TTC1__ACT_FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__TTC1__FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__TTC2__ACT_FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__TTC2__FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__TTC3__ACT_FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__TTC3__FREQMHZ {100.000000} \
##    CONFIG.PSU__IOU_SLCR__WDT0__ACT_FREQMHZ {99.999001} \
##    CONFIG.PSU__IOU_SLCR__WDT0__FREQMHZ {99.999001} \
##    CONFIG.PSU__IOU_SLCR__WDT_CLK_SEL__SELECT {APB} \
##    CONFIG.PSU__LPD_SLCR__CSUPMU__ACT_FREQMHZ {100.000000} \
##    CONFIG.PSU__LPD_SLCR__CSUPMU__FREQMHZ {100.000000} \
##    CONFIG.PSU__MAXIGP0__DATA_WIDTH {128} \
##    CONFIG.PSU__MAXIGP1__DATA_WIDTH {128} \
##    CONFIG.PSU__MAXIGP2__DATA_WIDTH {32} \
##    CONFIG.PSU__OVERRIDE__BASIC_CLOCK {0} \
##    CONFIG.PSU__PL_CLK0_BUF {TRUE} \
##    CONFIG.PSU__PL_CLK1_BUF {FALSE} \
##    CONFIG.PSU__PMU_COHERENCY {0} \
##    CONFIG.PSU__PMU__AIBACK__ENABLE {0} \
##    CONFIG.PSU__PMU__EMIO_GPI__ENABLE {0} \
##    CONFIG.PSU__PMU__EMIO_GPO__ENABLE {0} \
##    CONFIG.PSU__PMU__GPI0__ENABLE {1} \
##    CONFIG.PSU__PMU__GPI0__IO {MIO 26} \
##    CONFIG.PSU__PMU__GPI1__ENABLE {0} \
##    CONFIG.PSU__PMU__GPI2__ENABLE {0} \
##    CONFIG.PSU__PMU__GPI3__ENABLE {0} \
##    CONFIG.PSU__PMU__GPI4__ENABLE {0} \
##    CONFIG.PSU__PMU__GPI5__ENABLE {1} \
##    CONFIG.PSU__PMU__GPI5__IO {MIO 31} \
##    CONFIG.PSU__PMU__GPO0__ENABLE {1} \
##    CONFIG.PSU__PMU__GPO0__IO {MIO 32} \
##    CONFIG.PSU__PMU__GPO1__ENABLE {1} \
##    CONFIG.PSU__PMU__GPO1__IO {MIO 33} \
##    CONFIG.PSU__PMU__GPO2__ENABLE {1} \
##    CONFIG.PSU__PMU__GPO2__IO {MIO 34} \
##    CONFIG.PSU__PMU__GPO2__POLARITY {high} \
##    CONFIG.PSU__PMU__GPO3__ENABLE {1} \
##    CONFIG.PSU__PMU__GPO3__IO {MIO 35} \
##    CONFIG.PSU__PMU__GPO3__POLARITY {low} \
##    CONFIG.PSU__PMU__GPO4__ENABLE {0} \
##    CONFIG.PSU__PMU__GPO5__ENABLE {0} \
##    CONFIG.PSU__PMU__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__PMU__PLERROR__ENABLE {0} \
##    CONFIG.PSU__PRESET_APPLIED {1} \
##    CONFIG.PSU__PROTECTION__MASTERS {\
## USB1:NonSecure;0|USB0:NonSecure;0|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;0|S_AXI_HP3_FPD:NA;0|S_AXI_HP2_FPD:NA;0|S_AXI_HP1_FPD:NA;0|S_AXI_HP0_FPD:NA;1|S_AXI_ACP:NA;1|S_AXI_ACE:NA;0|SD1:NonSecure;0|SD0:NonSecure;0|SATA1:NonSecure;0|SATA0:NonSecure;0|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;1|PMU:NA;1|PCIe:NonSecure;0|NAND:NonSecure;0|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;0|GEM2:NonSecure;0|GEM1:NonSecure;0|GEM0:NonSecure;0|FDMA:NonSecure;1|DP:NonSecure;0|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1} \
##    CONFIG.PSU__PROTECTION__SLAVES {\
## LPD;USB3_1_XHCI;FE300000;FE3FFFFF;0|LPD;USB3_1;FF9E0000;FF9EFFFF;0|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;0|LPD;USB3_0;FF9D0000;FF9DFFFF;0|LPD;UART1;FF010000;FF01FFFF;0|LPD;UART0;FF000000;FF00FFFF;0|LPD;TTC3;FF140000;FF14FFFF;1|LPD;TTC2;FF130000;FF13FFFF;1|LPD;TTC1;FF120000;FF12FFFF;1|LPD;TTC0;FF110000;FF11FFFF;1|FPD;SWDT1;FD4D0000;FD4DFFFF;1|LPD;SWDT0;FF150000;FF15FFFF;1|LPD;SPI1;FF050000;FF05FFFF;1|LPD;SPI0;FF040000;FF04FFFF;0|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;0|LPD;SD0;FF160000;FF16FFFF;0|FPD;SATA;FD0C0000;FD0CFFFF;0|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;1|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;0|FPD;PCIE_LOW;E0000000;EFFFFFFF;0|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;0|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;0|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;0|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;0|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;0|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;1|LPD;I2C0;FF020000;FF02FFFF;0|FPD;GPU;FD4B0000;FD4BFFFF;1|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;0|LPD;GEM2;FF0D0000;FF0DFFFF;0|LPD;GEM1;FF0C0000;FF0CFFFF;0|LPD;GEM0;FF0B0000;FF0BFFFF;0|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display\
## Port;FD4A0000;FD4AFFFF;0|FPD;DPDMA;FD4C0000;FD4CFFFF;0|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;87FFFFFFF;1|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;1|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;0|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1} \
##    CONFIG.PSU__PSS_REF_CLK__FREQMHZ {33.333} \
##    CONFIG.PSU__QSPI_COHERENCY {0} \
##    CONFIG.PSU__QSPI_ROUTE_THROUGH_FPD {0} \
##    CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {0} \
##    CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
##    CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__QSPI__PERIPHERAL__IO {MIO 0 .. 5} \
##    CONFIG.PSU__QSPI__PERIPHERAL__MODE {Single} \
##    CONFIG.PSU__SATA__REF_CLK_FREQ {<Select>} \
##    CONFIG.PSU__SATA__REF_CLK_SEL {<Select>} \
##    CONFIG.PSU__SAXIGP2__DATA_WIDTH {128} \
##    CONFIG.PSU__SAXIGP3__DATA_WIDTH {128} \
##    CONFIG.PSU__SPI1__GRP_SS0__ENABLE {1} \
##    CONFIG.PSU__SPI1__GRP_SS0__IO {MIO 9} \
##    CONFIG.PSU__SPI1__GRP_SS1__ENABLE {0} \
##    CONFIG.PSU__SPI1__GRP_SS2__ENABLE {0} \
##    CONFIG.PSU__SPI1__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__SPI1__PERIPHERAL__IO {MIO 6 .. 11} \
##    CONFIG.PSU__SWDT0__CLOCK__ENABLE {0} \
##    CONFIG.PSU__SWDT0__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__SWDT0__RESET__ENABLE {0} \
##    CONFIG.PSU__SWDT1__CLOCK__ENABLE {0} \
##    CONFIG.PSU__SWDT1__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__SWDT1__RESET__ENABLE {0} \
##    CONFIG.PSU__TTC0__CLOCK__ENABLE {0} \
##    CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__TTC0__WAVEOUT__ENABLE {0} \
##    CONFIG.PSU__TTC1__CLOCK__ENABLE {0} \
##    CONFIG.PSU__TTC1__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__TTC1__WAVEOUT__ENABLE {0} \
##    CONFIG.PSU__TTC2__CLOCK__ENABLE {0} \
##    CONFIG.PSU__TTC2__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__TTC2__WAVEOUT__ENABLE {0} \
##    CONFIG.PSU__TTC3__CLOCK__ENABLE {0} \
##    CONFIG.PSU__TTC3__PERIPHERAL__ENABLE {1} \
##    CONFIG.PSU__TTC3__WAVEOUT__ENABLE {0} \
##    CONFIG.PSU__USB0__REF_CLK_FREQ {<Select>} \
##    CONFIG.PSU__USB0__REF_CLK_SEL {<Select>} \
##    CONFIG.PSU__USE__IRQ0 {1} \
##    CONFIG.PSU__USE__M_AXI_GP0 {1} \
##    CONFIG.PSU__USE__M_AXI_GP1 {0} \
##    CONFIG.PSU__USE__M_AXI_GP2 {0} \
##    CONFIG.PSU__USE__S_AXI_ACP {1} \
##    CONFIG.PSU__USE__S_AXI_GP2 {1} \
##    CONFIG.PSU__USE__S_AXI_GP3 {0} \
##  ] $zynq_ultra_ps_e_0
## 
##   # Add FAN_EN
##   add_fan_enable $zynq_ultra_ps_e_0 FAN_EN ttc0
## 
##   # Create interface connections
##   connect_bd_intf_net -intf_net ArgSort_AXI_1_MRG_AXI [get_bd_intf_pins ArgSort_AXI_1/MRG_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]
##   connect_bd_intf_net -intf_net ArgSort_AXI_1_STM_AXI [get_bd_intf_pins ArgSort_AXI_1/STM_AXI] [get_bd_intf_pins ZYNQMP_ACP_ADAPTER_0/AXI]
##   connect_bd_intf_net -intf_net ZYNQMP_ACP_ADAPTER_0_ACP [get_bd_intf_pins ZYNQMP_ACP_ADAPTER_0/ACP] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_ACP_FPD]
##   connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins ArgSort_AXI_1/CSR_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
##   connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]
## 
##   # Create port connections
##   connect_bd_net -net ArgSort_AXI_1_INTERRUPT [get_bd_pins ArgSort_AXI_1/INTERRUPT] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
##   connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins ArgSort_AXI_1/ACLK] [get_bd_pins ZYNQMP_ACP_ADAPTER_0/ACLK] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins rst_ps8_0_99M/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxiacp_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp0_fpd_aclk]
##   connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins rst_ps8_0_99M/dcm_locked]
##   connect_bd_net -net rst_ps8_0_99M_peripheral_aresetn [get_bd_pins ArgSort_AXI_1/ARESETn] [get_bd_pins ZYNQMP_ACP_ADAPTER_0/ARESETn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins rst_ps8_0_99M/peripheral_aresetn]
##   connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
##   connect_bd_net -net zynq_ultra_ps_e_0_pl_resetn0 [get_bd_pins clk_wiz_0/resetn] [get_bd_pins rst_ps8_0_99M/ext_reset_in] [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0]
## 
##   # Create address segments
##   assign_bd_address -offset 0x00000000 -range 0x00010000000000000000 -target_address_space [get_bd_addr_spaces ArgSort_AXI_1/STM_AXI] [get_bd_addr_segs ZYNQMP_ACP_ADAPTER_0/AXI/reg0] -force
##   assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces ArgSort_AXI_1/MRG_AXI] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
##   assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces ArgSort_AXI_1/MRG_AXI] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
##   assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces ArgSort_AXI_1/MRG_AXI] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM] -force
##   assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces ArgSort_AXI_1/MRG_AXI] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
##   assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces ZYNQMP_ACP_ADAPTER_0/ACP] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIACP/ACP_DDR_HIGH] -force
##   assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces ZYNQMP_ACP_ADAPTER_0/ACP] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIACP/ACP_DDR_LOW] -force
##   assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces ZYNQMP_ACP_ADAPTER_0/ACP] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIACP/ACP_LPS_OCM] -force
##   assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces ZYNQMP_ACP_ADAPTER_0/ACP] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIACP/ACP_QSPI] -force
##   assign_bd_address -offset 0xA0001000 -range 0x00001000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs ArgSort_AXI_1/CSR_AXI/reg0] -force
## 
## 
##   # Restore current instance
##   current_bd_instance $oldCurInst
## 
##   save_bd_design
## }
## create_root_design ""
INFO: [Ipptcl 7-1463] No Compatible Board Interface found. Board Tab not created in customize GUI
create_bd_cell: Time (s): cpu = 00:00:07 ; elapsed = 00:00:10 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 23670 ; free virtual = 122024
INFO: [Ipptcl 7-1463] No Compatible Board Interface found. Board Tab not created in customize GUI
Slave segment '/ZYNQMP_ACP_ADAPTER_0/AXI/reg0' is being assigned into address space '/ArgSort_AXI_1/STM_AXI' at <0x0_0000_0000_0000_0000 [ 16E ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH' is being assigned into address space '/ArgSort_AXI_1/MRG_AXI' at <0x8_0000_0000 [ 32G ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW' is being assigned into address space '/ArgSort_AXI_1/MRG_AXI' at <0x0000_0000 [ 2G ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM' is being assigned into address space '/ArgSort_AXI_1/MRG_AXI' at <0xFF00_0000 [ 16M ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI' is being assigned into address space '/ArgSort_AXI_1/MRG_AXI' at <0xC000_0000 [ 512M ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIACP/ACP_DDR_HIGH' is being assigned into address space '/ZYNQMP_ACP_ADAPTER_0/ACP' at <0x8_0000_0000 [ 32G ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIACP/ACP_DDR_LOW' is being assigned into address space '/ZYNQMP_ACP_ADAPTER_0/ACP' at <0x0000_0000 [ 2G ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIACP/ACP_LPS_OCM' is being assigned into address space '/ZYNQMP_ACP_ADAPTER_0/ACP' at <0xFF00_0000 [ 16M ]>.
Slave segment '/zynq_ultra_ps_e_0/SAXIACP/ACP_QSPI' is being assigned into address space '/ZYNQMP_ACP_ADAPTER_0/ACP' at <0xC000_0000 [ 512M ]>.
Slave segment '/ArgSort_AXI_1/CSR_AXI/reg0' is being assigned into address space '/zynq_ultra_ps_e_0/Data' at <0xA000_1000 [ 4K ]>.
Wrote  : </mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.srcs/sources_1/bd/design_1/design_1.bd> 
## common::send_gid_msg -ssname BD::TCL -id 2053 -severity "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."
WARNING: [BD::TCL 103-2053] This Tcl script was generated from a block design that has not been validated. It is possible that design <design_1> may result in errors during validation.
WARNING: [BD 17-144] The ACP interface on Zynq only supports 16 and 64 bit INCR commands. For any other commands, a SLVERR will be generated. If the master generates any other kind of transaction, you may require an additional adapter before connecting your master to the Zynq UltraScale+ IP. For more details refer to Answer Record 66643
INFO: [xilinx.com:ip:clk_wiz:6.0-1] /clk_wiz_0 clk_wiz propagate
INFO: [xilinx.com:ip:clk_wiz:6.0-1] /clk_wiz_0 clk_wiz propagate
WARNING: [BD 41-237] Bus Interface property AWUSER_WIDTH does not match between /axi_interconnect_0/s00_couplers/auto_ds/S_AXI(0) and /zynq_ultra_ps_e_0/M_AXI_HPM0_FPD(16)
WARNING: [BD 41-237] Bus Interface property ARUSER_WIDTH does not match between /axi_interconnect_0/s00_couplers/auto_ds/S_AXI(0) and /zynq_ultra_ps_e_0/M_AXI_HPM0_FPD(16)
WARNING: [BD 41-927] Following properties on pin /ArgSort_AXI_1/ACLK have been updated from connected ip, but BD cell '/ArgSort_AXI_1' does not accept parameter changes, so they may not be synchronized with cell properties:
	FREQ_HZ = 249997500 
Please resolve any mismatches by directly setting properties on BD cell </ArgSort_AXI_1> to completely resolve these warnings.
WARNING: [BD 41-927] Following properties on pin /ZYNQMP_ACP_ADAPTER_0/ACLK have been updated from connected ip, but BD cell '/ZYNQMP_ACP_ADAPTER_0' does not accept parameter changes, so they may not be synchronized with cell properties:
	FREQ_HZ = 249997500 
Please resolve any mismatches by directly setting properties on BD cell </ZYNQMP_ACP_ADAPTER_0> to completely resolve these warnings.
Wrote  : </mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.srcs/sources_1/bd/design_1/design_1.bd> 
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_awid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_AWID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_BID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_bid'(6) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_arid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_ARID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_RID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_rid'(6) - Only lower order bits will be connected.
VHDL Output written to : /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_awid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_AWID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_BID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_bid'(6) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_arid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_ARID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_RID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_rid'(6) - Only lower order bits will be connected.
VHDL Output written to : /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/sim/design_1.vhd
VHDL Output written to : /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/hdl/design_1_wrapper.vhd
# if {[info exists constrs_file_list] && [llength $constrs_file_list] > 0 } {
#     add_files    -fileset constrs_1 -norecurse $constrs_file_list
# }
INFO: [Common 17-206] Exiting Vivado at Tue May 20 12:01:20 2025...
```

#### Implementation (but abnormal program termination)

```console
shell$ make binary
vivado -mode batch -source implementation.tcl

****** Vivado v2021.2 (64-bit)
  **** SW Build 3367213 on Tue Oct 19 02:47:39 MDT 2021
  **** IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
    ** Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

source implementation.tcl
# set project_directory       [file dirname [info script]]
# set project_name            "project"
# if {[info exists project_name     ] == 0} {
#     set project_name        "project"
# }
# if {[info exists project_directory] == 0} {
#     set project_directory   [pwd]
# }
# open_project [file join $project_directory $project_name]
Scanning sources...
Finished scanning sources
INFO: [IP_Flow 19-234] Refreshing IP repositories
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ip'.
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ZynqMP-ACP-Adapter/ip'.
INFO: [IP_Flow 19-2313] Loaded Vivado IP repository '/home/ichiro/Xilinx/Vivado/2021.2/data/ip'.
# launch_runs synth_1 -job 4
INFO: [BD 41-1662] The design 'design_1.bd' is already validated. Therefore parameter propagation will not be re-run.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_awid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_AWID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_BID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_bid'(6) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_arid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_ARID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_RID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_rid'(6) - Only lower order bits will be connected.
VHDL Output written to : /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_awid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_AWID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_BID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_bid'(6) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/zynq_ultra_ps_e_0/saxigp2_arid'(6) to pin: '/ArgSort_AXI_1/MRG_AXI_ARID'(2) - Only lower order bits will be connected.
WARNING: [BD 41-2384] Width mismatch when connecting pin: '/ArgSort_AXI_1/MRG_AXI_RID'(2) to pin: '/zynq_ultra_ps_e_0/saxigp2_rid'(6) - Only lower order bits will be connected.
VHDL Output written to : /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/sim/design_1.vhd
VHDL Output written to : /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/hdl/design_1_wrapper.vhd
INFO: [BD 41-1029] Generation completed for the IP Integrator block ArgSort_AXI_1 .
INFO: [BD 41-1029] Generation completed for the IP Integrator block ZYNQMP_ACP_ADAPTER_0 .
WARNING: [IP_Flow 19-4994] Overwriting existing constraint file '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_ds_0/design_1_auto_ds_0_ooc.xdc'
INFO: [IP_Flow 19-5611] Unable to find an associated reset port for the interface 'S_AXI'. A default connection has been created.
INFO: [IP_Flow 19-5611] Unable to find an associated reset port for the interface 'M_AXI'. A default connection has been created.
INFO: [BD 41-1029] Generation completed for the IP Integrator block axi_interconnect_0/s00_couplers/auto_ds .
WARNING: [IP_Flow 19-4994] Overwriting existing constraint file '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_ooc.xdc'
INFO: [BD 41-1029] Generation completed for the IP Integrator block axi_interconnect_0/s00_couplers/auto_pc .
INFO: [BD 41-1029] Generation completed for the IP Integrator block clk_wiz_0 .
INFO: [BD 41-1029] Generation completed for the IP Integrator block rst_ps8_0_99M .
INFO: [xilinx.com:ip:zynq_ultra_ps_e:3.3-0] design_1_zynq_ultra_ps_e_0_0: 
Changes in your design (including the PCW configuration settings) are not automatically exported from Vivado to Xilinx's SDK, Petalinux or Yocto.
This is by design to avoid disrupting existing embedded development efforts. To have any changes of your design taking effect in the embedded software flow please export your
design by going through Vivado's main menu, click on File, then Export finally select Export Hardware, please ensure you click on the Include BitStream option.
The auto-generated HDF file is all you need to import in Xilinx's SDK, Petalinux or Yocto for your changes to be reflected in the Embedded Software Flow.
For more information, please consult PG201, section: Exporting PCW Settings to Embedded Software Flows
INFO: [PSU-0] Address Range of DDR (0x7ff00000 to 0x7fffffff) is reserved by PMU for internal purpose.
INFO: [IP_Flow 19-5611] Unable to find an associated reset port for the interface 'M_AXI_HPM0_FPD'. A default connection has been created.
INFO: [IP_Flow 19-5611] Unable to find an associated reset port for the interface 'S_AXI_ACP_FPD'. A default connection has been created.
INFO: [IP_Flow 19-5611] Unable to find an associated reset port for the interface 'S_AXI_HP0_FPD'. A default connection has been created.
INFO: [BD 41-1029] Generation completed for the IP Integrator block zynq_ultra_ps_e_0 .
INFO: [BD 41-1029] Generation completed for the IP Integrator block ttc0_slice .
Exporting to file /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh
Generated Hardware Definition File /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.hwdef
WARNING: [Vivado 12-7122] Auto Incremental Compile:: No reference checkpoint was found in run synth_1. Auto-incremental flow will not be run, the standard flow will be run instead.
[Tue May 20 12:02:30 2025] Launched design_1_zynq_ultra_ps_e_0_0_synth_1, design_1_rst_ps8_0_99M_0_synth_1, design_1_clk_wiz_0_0_synth_1, design_1_auto_pc_0_synth_1, design_1_auto_ds_0_synth_1, design_1_ZYNQMP_ACP_ADAPTER_0_0_synth_1, design_1_ArgSort_AXI_1_0_synth_1...
Run output will be captured here:
design_1_zynq_ultra_ps_e_0_0_synth_1: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/design_1_zynq_ultra_ps_e_0_0_synth_1/runme.log
design_1_rst_ps8_0_99M_0_synth_1: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/design_1_rst_ps8_0_99M_0_synth_1/runme.log
design_1_clk_wiz_0_0_synth_1: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/design_1_clk_wiz_0_0_synth_1/runme.log
design_1_auto_pc_0_synth_1: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/design_1_auto_pc_0_synth_1/runme.log
design_1_auto_ds_0_synth_1: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/design_1_auto_ds_0_synth_1/runme.log
design_1_ZYNQMP_ACP_ADAPTER_0_0_synth_1: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/design_1_ZYNQMP_ACP_ADAPTER_0_0_synth_1/runme.log
design_1_ArgSort_AXI_1_0_synth_1: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/design_1_ArgSort_AXI_1_0_synth_1/runme.log
[Tue May 20 12:02:30 2025] Launched synth_1...
Run output will be captured here: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/runme.log
launch_runs: Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 24363 ; free virtual = 122717
# wait_on_run synth_1
[Tue May 20 12:02:30 2025] Waiting for synth_1 to finish...

*** Running vivado
    with args -log design_1_wrapper.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source design_1_wrapper.tcl


****** Vivado v2021.2 (64-bit)
  **** SW Build 3367213 on Tue Oct 19 02:47:39 MDT 2021
  **** IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
    ** Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

source design_1_wrapper.tcl -notrace
INFO: [IP_Flow 19-234] Refreshing IP repositories
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ip'.
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ZynqMP-ACP-Adapter/ip'.
INFO: [IP_Flow 19-2313] Loaded Vivado IP repository '/home/ichiro/Xilinx/Vivado/2021.2/data/ip'.
Command: synth_design -top design_1_wrapper -part xck26-sfvc784-2LV-c
Starting synth_design
Attempting to get a license for feature 'Synthesis' and/or device 'xck26'
INFO: [Common 17-349] Got license for feature 'Synthesis' and/or device 'xck26'
INFO: [Device 21-403] Loading part xck26-sfvc784-2LV-c
INFO: [Synth 8-7079] Multithreading enabled for synth_design using a maximum of 4 processes.
INFO: [Synth 8-7078] Launching helper process for spawning children vivado processes
INFO: [Synth 8-7075] Helper process launched with PID 27451
---------------------------------------------------------------------------------
Starting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20872 ; free virtual = 119248
---------------------------------------------------------------------------------
INFO: [Synth 8-638] synthesizing module 'design_1_wrapper' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.srcs/sources_1/imports/hdl/design_1_wrapper.vhd:20]
INFO: [Synth 8-3491] module 'design_1' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:760' bound to instance 'design_1_i' of component 'design_1' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.srcs/sources_1/imports/hdl/design_1_wrapper.vhd:27]
INFO: [Synth 8-638] synthesizing module 'design_1' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:770]
INFO: [Synth 8-3491] module 'design_1_ArgSort_AXI_1_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_ArgSort_AXI_1_0_stub.vhdl:5' bound to instance 'ArgSort_AXI_1' of component 'design_1_ArgSort_AXI_1_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:1319]
INFO: [Synth 8-638] synthesizing module 'design_1_ArgSort_AXI_1_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_ArgSort_AXI_1_0_stub.vhdl:115]
INFO: [Synth 8-3491] module 'design_1_ZYNQMP_ACP_ADAPTER_0_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_ZYNQMP_ACP_ADAPTER_0_0_stub.vhdl:5' bound to instance 'ZYNQMP_ACP_ADAPTER_0' of component 'design_1_ZYNQMP_ACP_ADAPTER_0_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:1426]
INFO: [Synth 8-638] synthesizing module 'design_1_ZYNQMP_ACP_ADAPTER_0_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_ZYNQMP_ACP_ADAPTER_0_0_stub.vhdl:95]
INFO: [Synth 8-638] synthesizing module 'design_1_axi_interconnect_0_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:576]
INFO: [Synth 8-638] synthesizing module 's00_couplers_imp_O7FAN0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:77]
INFO: [Synth 8-3491] module 'design_1_auto_ds_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_auto_ds_0_stub.vhdl:5' bound to instance 'auto_ds' of component 'design_1_auto_ds_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:368]
INFO: [Synth 8-638] synthesizing module 'design_1_auto_ds_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_auto_ds_0_stub.vhdl:87]
INFO: [Synth 8-3491] module 'design_1_auto_pc_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_auto_pc_0_stub.vhdl:5' bound to instance 'auto_pc' of component 'design_1_auto_pc_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:447]
INFO: [Synth 8-638] synthesizing module 'design_1_auto_pc_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_auto_pc_0_stub.vhdl:67]
INFO: [Synth 8-256] done synthesizing module 's00_couplers_imp_O7FAN0' (1#1) [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:77]
INFO: [Synth 8-256] done synthesizing module 'design_1_axi_interconnect_0_0' (2#1) [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:576]
INFO: [Synth 8-3491] module 'design_1_clk_wiz_0_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_clk_wiz_0_0_stub.vhdl:5' bound to instance 'clk_wiz_0' of component 'design_1_clk_wiz_0_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:1576]
INFO: [Synth 8-638] synthesizing module 'design_1_clk_wiz_0_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_clk_wiz_0_0_stub.vhdl:15]
INFO: [Synth 8-3491] module 'design_1_rst_ps8_0_99M_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_rst_ps8_0_99M_0_stub.vhdl:5' bound to instance 'rst_ps8_0_99M' of component 'design_1_rst_ps8_0_99M_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:1583]
INFO: [Synth 8-638] synthesizing module 'design_1_rst_ps8_0_99M_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_rst_ps8_0_99M_0_stub.vhdl:21]
INFO: [Synth 8-3491] module 'design_1_ttc0_slice_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ttc0_slice_0/synth/design_1_ttc0_slice_0.v:57' bound to instance 'ttc0_slice' of component 'design_1_ttc0_slice_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:1596]
INFO: [Synth 8-6157] synthesizing module 'design_1_ttc0_slice_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ttc0_slice_0/synth/design_1_ttc0_slice_0.v:57]
INFO: [Synth 8-6157] synthesizing module 'xlslice_v1_0_2_xlslice' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v:13]
INFO: [Synth 8-6155] done synthesizing module 'xlslice_v1_0_2_xlslice' (3#1) [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v:13]
INFO: [Synth 8-6155] done synthesizing module 'design_1_ttc0_slice_0' (4#1) [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ttc0_slice_0/synth/design_1_ttc0_slice_0.v:57]
INFO: [Synth 8-3491] module 'design_1_zynq_ultra_ps_e_0_0' declared at '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_zynq_ultra_ps_e_0_0_stub.vhdl:5' bound to instance 'zynq_ultra_ps_e_0' of component 'design_1_zynq_ultra_ps_e_0_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:1601]
INFO: [Synth 8-638] synthesizing module 'design_1_zynq_ultra_ps_e_0_0' [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/.Xil/Vivado-27446-Jabberwock/realtime/design_1_zynq_ultra_ps_e_0_0_stub.vhdl:136]
INFO: [Synth 8-256] done synthesizing module 'design_1' (5#1) [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/synth/design_1.vhd:770]
INFO: [Synth 8-256] done synthesizing module 'design_1_wrapper' (6#1) [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.srcs/sources_1/imports/hdl/design_1_wrapper.vhd:20]
WARNING: [Synth 8-7129] Port Din[1] in module xlslice_v1_0_2_xlslice is either unconnected or has no load
WARNING: [Synth 8-7129] Port Din[0] in module xlslice_v1_0_2_xlslice is either unconnected or has no load
WARNING: [Synth 8-7129] Port M_ACLK in module s00_couplers_imp_O7FAN0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port M_ARESETN in module s00_couplers_imp_O7FAN0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port ACLK in module design_1_axi_interconnect_0_0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port ARESETN in module design_1_axi_interconnect_0_0 is either unconnected or has no load
---------------------------------------------------------------------------------
Finished RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20286 ; free virtual = 118662
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20235 ; free virtual = 118610
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20235 ; free virtual = 118610
---------------------------------------------------------------------------------
Netlist sorting complete. Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20225 ; free virtual = 118601
INFO: [Project 1-570] Preparing netlist for logic optimization

Processing XDC Constraints
Initializing timing engine
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ArgSort_AXI_1_0/design_1_ArgSort_AXI_1_0/design_1_ArgSort_AXI_1_0_in_context.xdc] for cell 'design_1_i/ArgSort_AXI_1'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ArgSort_AXI_1_0/design_1_ArgSort_AXI_1_0/design_1_ArgSort_AXI_1_0_in_context.xdc] for cell 'design_1_i/ArgSort_AXI_1'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ZYNQMP_ACP_ADAPTER_0_0/design_1_ZYNQMP_ACP_ADAPTER_0_0/design_1_ZYNQMP_ACP_ADAPTER_0_0_in_context.xdc] for cell 'design_1_i/ZYNQMP_ACP_ADAPTER_0'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ZYNQMP_ACP_ADAPTER_0_0/design_1_ZYNQMP_ACP_ADAPTER_0_0/design_1_ZYNQMP_ACP_ADAPTER_0_0_in_context.xdc] for cell 'design_1_i/ZYNQMP_ACP_ADAPTER_0'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_ds_0/design_1_auto_ds_0/design_1_auto_ds_0_in_context.xdc] for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_ds'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_ds_0/design_1_auto_ds_0/design_1_auto_ds_0_in_context.xdc] for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_ds'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0/design_1_auto_pc_0_in_context.xdc] for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_pc'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0/design_1_auto_pc_0_in_context.xdc] for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_pc'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_in_context.xdc] for cell 'design_1_i/clk_wiz_0'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_in_context.xdc] for cell 'design_1_i/clk_wiz_0'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0_in_context.xdc] for cell 'design_1_i/rst_ps8_0_99M'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0_in_context.xdc] for cell 'design_1_i/rst_ps8_0_99M'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0_in_context.xdc] for cell 'design_1_i/zynq_ultra_ps_e_0'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0_in_context.xdc] for cell 'design_1_i/zynq_ultra_ps_e_0'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/design_1_pin.xdc]
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/design_1_pin.xdc]
INFO: [Project 1-236] Implementation specific constraints were found while reading constraint file [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/design_1_pin.xdc]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [.Xil/design_1_wrapper_propImpl.xdc].
Resolution: To avoid this warning, move constraints listed in [.Xil/design_1_wrapper_propImpl.xdc] to another XDC file and exclude this new file from synthesis with the used_in_synthesis property (File Properties dialog in GUI) and re-run elaboration/synthesis.
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/dont_touch.xdc]
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/dont_touch.xdc]
Completed Processing XDC Constraints

Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21185 ; free virtual = 119560
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

Constraint Validation Runtime : Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21185 ; free virtual = 119560
---------------------------------------------------------------------------------
Finished Constraint Validation : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21284 ; free virtual = 119659
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Loading Part and Timing Information
---------------------------------------------------------------------------------
Loading part: xck26-sfvc784-2LV-c
INFO: [Synth 8-6742] Reading net delay rules and data
---------------------------------------------------------------------------------
Finished Loading Part and Timing Information : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21284 ; free virtual = 119659
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Applying 'set_property' XDC Constraints
---------------------------------------------------------------------------------
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/ArgSort_AXI_1. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/ZYNQMP_ACP_ADAPTER_0. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/axi_interconnect_0/s00_couplers/auto_ds. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/axi_interconnect_0/s00_couplers/auto_pc. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/axi_interconnect_0. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/clk_wiz_0. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/rst_ps8_0_99M. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/zynq_ultra_ps_e_0. (constraint file  auto generated constraint).
Applied set_property KEEP_HIERARCHY = SOFT for design_1_i/ttc0_slice. (constraint file  auto generated constraint).
---------------------------------------------------------------------------------
Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21285 ; free virtual = 119661
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21278 ; free virtual = 119654
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start RTL Component Statistics 
---------------------------------------------------------------------------------
Detailed RTL Component Info : 
---------------------------------------------------------------------------------
Finished RTL Component Statistics 
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Part Resource Summary
---------------------------------------------------------------------------------
Part Resources:
DSPs: 1248 (col length:96)
BRAMs: 288 (col length: RAMB18 96 RAMB36 48)
---------------------------------------------------------------------------------
Finished Part Resource Summary
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Cross Boundary and Area Optimization
---------------------------------------------------------------------------------
WARNING: [Synth 8-7080] Parallel synthesis criteria is not met
WARNING: [Synth 8-7129] Port Din[1] in module design_1_ttc0_slice_0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port Din[0] in module design_1_ttc0_slice_0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port ACLK in module design_1_axi_interconnect_0_0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port ARESETN in module design_1_axi_interconnect_0_0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port M00_ACLK in module design_1_axi_interconnect_0_0 is either unconnected or has no load
WARNING: [Synth 8-7129] Port M00_ARESETN in module design_1_axi_interconnect_0_0 is either unconnected or has no load
---------------------------------------------------------------------------------
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21286 ; free virtual = 119661
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Applying XDC Timing Constraints
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20699 ; free virtual = 119074
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Timing Optimization
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Timing Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20698 ; free virtual = 119073
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Technology Mapping
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Technology Mapping : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20705 ; free virtual = 119081
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start IO Insertion
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Flattening Before IO Insertion
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Flattening Before IO Insertion
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Final Netlist Cleanup
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Final Netlist Cleanup
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished IO Insertion : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20658 ; free virtual = 119034
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Instances
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Instances : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20658 ; free virtual = 119034
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Rebuilding User Hierarchy
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20658 ; free virtual = 119034
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Ports
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Ports : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20658 ; free virtual = 119034
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20658 ; free virtual = 119034
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Nets
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Nets : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20658 ; free virtual = 119034
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Writing Synthesis Report
---------------------------------------------------------------------------------

Report BlackBoxes: 
+------+--------------------------------+----------+
|      |BlackBox name                   |Instances |
+------+--------------------------------+----------+
|1     |design_1_auto_ds_0              |         1|
|2     |design_1_auto_pc_0              |         1|
|3     |design_1_ArgSort_AXI_1_0        |         1|
|4     |design_1_ZYNQMP_ACP_ADAPTER_0_0 |         1|
|5     |design_1_clk_wiz_0_0            |         1|
|6     |design_1_rst_ps8_0_99M_0        |         1|
|7     |design_1_zynq_ultra_ps_e_0_0    |         1|
+------+--------------------------------+----------+

Report Cell Usage: 
+------+-------------------------------------+------+
|      |Cell                                 |Count |
+------+-------------------------------------+------+
|1     |design_1_ArgSort_AXI_1_0_bbox        |     1|
|2     |design_1_ZYNQMP_ACP_ADAPTER_0_0_bbox |     1|
|3     |design_1_auto_ds_0_bbox              |     1|
|4     |design_1_auto_pc_0_bbox              |     1|
|5     |design_1_clk_wiz_0_0_bbox            |     1|
|6     |design_1_rst_ps8_0_99M_0_bbox        |     1|
|7     |design_1_zynq_ultra_ps_e_0_0_bbox    |     1|
|8     |OBUF                                 |     1|
+------+-------------------------------------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20658 ; free virtual = 119034
---------------------------------------------------------------------------------
Synthesis finished with 0 errors, 0 critical warnings and 7 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:15 ; elapsed = 00:00:19 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20700 ; free virtual = 119075
Synthesis Optimization Complete : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20699 ; free virtual = 119075
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20789 ; free virtual = 119165
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20711 ; free virtual = 119087
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

Synth Design complete, checksum: 58bdbcc7
INFO: [Common 17-83] Releasing license: Synthesis
46 Infos, 13 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20905 ; free virtual = 119280
INFO: [Common 17-1381] The checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/synth_1/design_1_wrapper.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Tue May 20 12:39:51 2025...
[Tue May 20 12:39:55 2025] synth_1 finished
wait_on_runs: Time (s): cpu = 00:39:30 ; elapsed = 00:37:26 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 22829 ; free virtual = 121205
# launch_runs impl_1  -job 4
[Tue May 20 12:39:59 2025] Launched impl_1...
Run output will be captured here: /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/impl_1/runme.log
# wait_on_run impl_1
[Tue May 20 12:39:59 2025] Waiting for impl_1 to finish...

*** Running vivado
    with args -log design_1_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source design_1_wrapper.tcl -notrace


****** Vivado v2021.2 (64-bit)
  **** SW Build 3367213 on Tue Oct 19 02:47:39 MDT 2021
  **** IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
    ** Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

source design_1_wrapper.tcl -notrace
INFO: [IP_Flow 19-234] Refreshing IP repositories
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ip'.
INFO: [IP_Flow 19-1700] Loaded user IP repository '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/ZynqMP-ACP-Adapter/ip'.
INFO: [IP_Flow 19-2313] Loaded Vivado IP repository '/home/ichiro/Xilinx/Vivado/2021.2/data/ip'.
Command: link_design -top design_1_wrapper -part xck26-sfvc784-2LV-c
Design is defaulting to srcset: sources_1
Design is defaulting to constrset: constrs_1
INFO: [Device 21-403] Loading part xck26-sfvc784-2LV-c
INFO: [Project 1-454] Reading design checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ArgSort_AXI_1_0/design_1_ArgSort_AXI_1_0.dcp' for cell 'design_1_i/ArgSort_AXI_1'
INFO: [Project 1-454] Reading design checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_ZYNQMP_ACP_ADAPTER_0_0/design_1_ZYNQMP_ACP_ADAPTER_0_0.dcp' for cell 'design_1_i/ZYNQMP_ACP_ADAPTER_0'
INFO: [Project 1-454] Reading design checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.dcp' for cell 'design_1_i/clk_wiz_0'
INFO: [Project 1-454] Reading design checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0.dcp' for cell 'design_1_i/rst_ps8_0_99M'
INFO: [Project 1-454] Reading design checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0.dcp' for cell 'design_1_i/zynq_ultra_ps_e_0'
INFO: [Project 1-454] Reading design checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_ds_0/design_1_auto_ds_0.dcp' for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_ds'
INFO: [Project 1-454] Reading design checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0.dcp' for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_pc'
Netlist sorting complete. Time (s): cpu = 00:00:00.91 ; elapsed = 00:00:00.92 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 21198 ; free virtual = 119573
INFO: [Netlist 29-17] Analyzing 1832 Unisim elements for replacement
INFO: [Netlist 29-28] Unisim Transformation completed in 0 CPU seconds
INFO: [Project 1-479] Netlist was created with Vivado 2021.2
INFO: [Project 1-570] Preparing netlist for logic optimization
WARNING: [Opt 31-32] Removing redundant IBUF since it is not being driven by a top-level port. design_1_i/clk_wiz_0/inst/clkin1_ibuf 
Resolution: The tool has removed redundant IBUF. To resolve this warning, check for redundant IBUF in the input design.
WARNING: [Constraints 18-550] Could not create 'IBUF_LOW_PWR' constraint because net 'design_1_i/clk_wiz_0/clk_in1' is not directly connected to top level port. Synthesis is ignored for IBUF_LOW_PWR but preserved for implementation.
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc] for cell 'design_1_i/clk_wiz_0/inst'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc] for cell 'design_1_i/clk_wiz_0/inst'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc] for cell 'design_1_i/clk_wiz_0/inst'
INFO: [Timing 38-35] Done setting XDC timing constraints. [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc:57]
INFO: [Timing 38-2] Deriving generated clocks [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc:57]
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc] for cell 'design_1_i/clk_wiz_0/inst'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0_board.xdc] for cell 'design_1_i/rst_ps8_0_99M/U0'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0_board.xdc] for cell 'design_1_i/rst_ps8_0_99M/U0'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0.xdc] for cell 'design_1_i/rst_ps8_0_99M/U0'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_rst_ps8_0_99M_0/design_1_rst_ps8_0_99M_0.xdc] for cell 'design_1_i/rst_ps8_0_99M/U0'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0.xdc] for cell 'design_1_i/zynq_ultra_ps_e_0/U0'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0.xdc] for cell 'design_1_i/zynq_ultra_ps_e_0/U0'
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/design_1_pin.xdc]
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/design_1_pin.xdc]
Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_ds_0/design_1_auto_ds_0_clocks.xdc] for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_ds/inst'
Finished Parsing XDC File [/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.gen/sources_1/bd/design_1/ip/design_1_auto_ds_0/design_1_auto_ds_0_clocks.xdc] for cell 'design_1_i/axi_interconnect_0/s00_couplers/auto_ds/inst'
INFO: [Project 1-1714] 3 XPM XDC files have been applied to the design.
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20495 ; free virtual = 118875
INFO: [Project 1-111] Unisim Transformation Summary:
  A total of 471 instances were transformed.
  RAM32M16 => RAM32M16 (RAMD32(x14), RAMS32(x2)): 5 instances
  RAM32X1D => RAM32X1D (RAMD32(x2)): 146 instances
  RAM64M => RAM64M (RAMD64E(x4)): 16 instances
  RAM64M8 => RAM64M8 (RAMD64E(x8)): 304 instances

21 Infos, 2 Warnings, 0 Critical Warnings and 0 Errors encountered.
link_design completed successfully
link_design: Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20496 ; free virtual = 118875
Command: opt_design
Attempting to get a license for feature 'Implementation' and/or device 'xck26'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xck26'
Running DRC as a precondition to command opt_design

Starting DRC Task
INFO: [DRC 23-27] Running DRC with 8 threads
INFO: [Project 1-461] DRC finished with 0 Errors
INFO: [Project 1-462] Please refer to the DRC report (report_drc) for more information.

Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.86 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20494 ; free virtual = 118874

Starting Cache Timing Information Task
INFO: [Timing 38-35] Done setting XDC timing constraints.
Ending Cache Timing Information Task | Checksum: 1d5dc9bf2

Time (s): cpu = 00:00:05 ; elapsed = 00:00:02 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20368 ; free virtual = 118748

Starting Logic Optimization Task

Phase 1 Retarget
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/AXI_IF/AR/dec_word_addr[4]_i_1 into driver instance design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/AXI_IF/AR/MAX_XFER_SIZE_GEN.REQ_SIZE_VALID_NE_0.GEN/FSM_onehot_curr_state[1]_i_3, which resulted in an inversion of 21 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/STM_RD/AXI_IF/REQ_QUEUE/xfer_running_i_1 into driver instance design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/STM_RD/AXI_IF/REQ_QUEUE/xfer_running_i_2, which resulted in an inversion of 2 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/STM_WR/AXI_IF/RES_QUEUE/xfer_running_i_1__1 into driver instance design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/STM_WR/AXI_IF/RES_QUEUE/xfer_running_i_2__2, which resulted in an inversion of 2 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/STM_WR/WRITER/CTRL/O_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/AADDR[63]_i_1__2 into driver instance design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/STM_WR/WRITER/CTRL/O_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/AADDR[63]_i_2__2, which resulted in an inversion of 6 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/CORE/OUTLET.QUEUE/Q__0/Q__0/curr_queue[2][VAL]_i_1__23 into driver instance design_1_i/ArgSort_AXI_1/U0/CORE/OUTLET.QUEUE/Q__0/Q__0/done_output_i_3__18, which resulted in an inversion of 5 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/CORE/SORT.TREE/TREE.A/TREE.NODE/MULTI_WORD.INTAKE.QUEUE/Q__0/QUEUE_SIZE_GT_0.curr_queue_data[2][140]_i_1__5 into driver instance design_1_i/ArgSort_AXI_1/U0/CORE/SORT.TREE/TREE.A/TREE.NODE/MULTI_WORD.INTAKE.QUEUE/Q__0/QUEUE_SIZE_GT_0.curr_queue_valid[2]_i_2__14, which resulted in an inversion of 14 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/CORE/SORT.TREE/TREE.B/TREE.NODE/MULTI_WORD.INTAKE.QUEUE/Q__0/QUEUE_SIZE_GT_0.curr_queue_data[2][140]_i_1__12 into driver instance design_1_i/ArgSort_AXI_1/U0/CORE/SORT.TREE/TREE.B/TREE.NODE/MULTI_WORD.INTAKE.QUEUE/Q__0/QUEUE_SIZE_GT_0.curr_queue_valid[2]_i_2__31, which resulted in an inversion of 14 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/CORE/SORT.TREE/TREE.NODE/MULTI_WORD.INTAKE.QUEUE/Q__0/QUEUE_SIZE_GT_0.curr_queue_data[2][140]_i_1__13 into driver instance design_1_i/ArgSort_AXI_1/U0/CORE/SORT.TREE/TREE.NODE/MULTI_WORD.INTAKE.QUEUE/Q__0/QUEUE_SIZE_GT_0.curr_queue_valid[2]_i_2__34, which resulted in an inversion of 14 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/CORE/STM_INTAKE.QUEUE/MULTI_WORD.INTAKE_QUEUE/Q__0/curr_queue[0][VAL]_i_1__22 into driver instance design_1_i/ArgSort_AXI_1/U0/CORE/STM_INTAKE.QUEUE/MULTI_WORD.INTAKE_QUEUE/Q__0/curr_queue[0][VAL]_i_2__20, which resulted in an inversion of 137 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/ArgSort_AXI_1/U0/CORE/STM_INTAKE.QUEUE/MULTI_WORD.PREPARE_QUEUE/Q/curr_queue[2][VAL]_i_1__22 into driver instance design_1_i/ArgSort_AXI_1/U0/CORE/STM_INTAKE.QUEUE/MULTI_WORD.PREPARE_QUEUE/Q/curr_queue[2][VAL]_i_2__22, which resulted in an inversion of 3 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/axi_interconnect_0/s00_couplers/auto_ds/inst/gen_downsizer.gen_simple_downsizer.axi_downsizer_inst/USE_READ.read_addr_inst/cmd_queue/inst/current_word_1[3]_i_1 into driver instance design_1_i/axi_interconnect_0/s00_couplers/auto_ds/inst/gen_downsizer.gen_simple_downsizer.axi_downsizer_inst/USE_READ.read_addr_inst/cmd_queue/inst/s_axi_rvalid_INST_0_i_3, which resulted in an inversion of 2 pins
INFO: [Opt 31-1287] Pulled Inverter design_1_i/axi_interconnect_0/s00_couplers/auto_ds/inst/gen_downsizer.gen_simple_downsizer.axi_downsizer_inst/USE_WRITE.USE_SPLIT.write_resp_inst/first_mi_word_i_2 into driver instance design_1_i/axi_interconnect_0/s00_couplers/auto_ds/inst/gen_downsizer.gen_simple_downsizer.axi_downsizer_inst/USE_WRITE.USE_SPLIT.write_resp_inst/s_axi_bvalid_INST_0_i_1, which resulted in an inversion of 5 pins
INFO: [Opt 31-138] Pushed 8 inverter(s) to 53302 load pin(s).
INFO: [Opt 31-49] Retargeted 0 cell(s).
Phase 1 Retarget | Checksum: 16e8d6959

Time (s): cpu = 00:00:10 ; elapsed = 00:00:06 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20405 ; free virtual = 118784
INFO: [Opt 31-389] Phase Retarget created 2 cells and removed 294 cells
INFO: [Opt 31-1021] In phase Retarget, 27 netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 

Phase 2 Constant propagation
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Phase 2 Constant propagation | Checksum: 130f92c69

Time (s): cpu = 00:00:11 ; elapsed = 00:00:07 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20398 ; free virtual = 118778
INFO: [Opt 31-389] Phase Constant propagation created 12 cells and removed 136 cells
INFO: [Opt 31-1021] In phase Constant propagation, 27 netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 

Phase 3 Sweep
Phase 3 Sweep | Checksum: 19f6772d2

Time (s): cpu = 00:00:13 ; elapsed = 00:00:08 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20384 ; free virtual = 118764
INFO: [Opt 31-389] Phase Sweep created 0 cells and removed 1779 cells
INFO: [Opt 31-1021] In phase Sweep, 97 netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 

Phase 4 BUFG optimization
INFO: [Opt 31-1077] Phase BUFG optimization inserted 0 global clock buffer(s) for CLOCK_LOW_FANOUT.
INFO: [Opt 31-129] Inserted BUFG to drive high-fanout reset|set|enable net. BUFG cell: design_1_i/rst_ps8_0_99M/U0/peripheral_aresetn[0]_BUFG_inst, Net: design_1_i/rst_ps8_0_99M/U0/peripheral_aresetn[0]
Phase 4 BUFG optimization | Checksum: 1c796e076

Time (s): cpu = 00:00:14 ; elapsed = 00:00:10 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20426 ; free virtual = 118806
INFO: [Opt 31-662] Phase BUFG optimization created 2 cells of which 1 are BUFGs and removed 0 cells.

Phase 5 Shift Register Optimization
INFO: [Opt 31-1064] SRL Remap converted 0 SRLs to 0 registers and converted 0 registers of register chains to 0 SRLs
Phase 5 Shift Register Optimization | Checksum: 1c796e076

Time (s): cpu = 00:00:14 ; elapsed = 00:00:10 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20427 ; free virtual = 118806
INFO: [Opt 31-389] Phase Shift Register Optimization created 0 cells and removed 0 cells

Phase 6 Post Processing Netlist
Phase 6 Post Processing Netlist | Checksum: 1c796e076

Time (s): cpu = 00:00:14 ; elapsed = 00:00:10 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20428 ; free virtual = 118807
INFO: [Opt 31-389] Phase Post Processing Netlist created 0 cells and removed 0 cells
INFO: [Opt 31-1021] In phase Post Processing Netlist, 33 netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 
Opt_design Change Summary
=========================


-------------------------------------------------------------------------------------------------------------------------
|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
|  Retarget                     |               2  |             294  |                                             27  |
|  Constant propagation         |              12  |             136  |                                             27  |
|  Sweep                        |               0  |            1779  |                                             97  |
|  BUFG optimization            |               2  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                             33  |
-------------------------------------------------------------------------------------------------------------------------



Starting Connectivity Check Task

Time (s): cpu = 00:00:00.19 ; elapsed = 00:00:00.18 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20401 ; free virtual = 118781
Ending Logic Optimization Task | Checksum: 1b5267f7e

Time (s): cpu = 00:00:19 ; elapsed = 00:00:13 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20401 ; free virtual = 118781

Starting Power Optimization Task
INFO: [Pwropt 34-132] Skipping clock gating for clocks with a period < 2.00 ns.
INFO: [Pwropt 34-9] Applying IDT optimizations ...
INFO: [Pwropt 34-10] Applying ODC optimizations ...
INFO: [Timing 38-35] Done setting XDC timing constraints.
Running Vector-less Activity Propagation...

Finished Running Vector-less Activity Propagation


Starting PowerOpt Patch Enables Task
INFO: [Pwropt 34-162] WRITE_MODE attribute of 0 BRAM(s) out of a total of 38 has been updated to save power. Run report_power_opt to get a complete listing of the BRAMs updated.
INFO: [Pwropt 34-201] Structural ODC has moved 0 WE to EN ports
Number of BRAM Ports augmented: 0 newly gated: 0 Total Ports: 76
Ending PowerOpt Patch Enables Task | Checksum: 1b5267f7e

Time (s): cpu = 00:00:00.36 ; elapsed = 00:00:00.35 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20310 ; free virtual = 118690
Ending Power Optimization Task | Checksum: 1b5267f7e

Time (s): cpu = 00:00:31 ; elapsed = 00:00:12 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20419 ; free virtual = 118799

Starting Final Cleanup Task
Ending Final Cleanup Task | Checksum: 1b5267f7e

Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20419 ; free virtual = 118799

Starting Netlist Obfuscation Task
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20419 ; free virtual = 118799
Ending Netlist Obfuscation Task | Checksum: 1b5267f7e

Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20419 ; free virtual = 118799
INFO: [Common 17-83] Releasing license: Implementation
61 Infos, 2 Warnings, 0 Critical Warnings and 0 Errors encountered.
opt_design completed successfully
opt_design: Time (s): cpu = 00:00:58 ; elapsed = 00:00:30 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20420 ; free virtual = 118800
INFO: [Timing 38-35] Done setting XDC timing constraints.
INFO: [Timing 38-480] Writing timing data to binary archive.
Writing placer database...
Writing XDEF routing.
Writing XDEF routing logical nets.
Writing XDEF routing special nets.
Write XDEF Complete: Time (s): cpu = 00:00:00.14 ; elapsed = 00:00:00.03 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20315 ; free virtual = 118695
INFO: [Common 17-1381] The checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/impl_1/design_1_wrapper_opt.dcp' has been generated.
write_checkpoint: Time (s): cpu = 00:00:23 ; elapsed = 00:00:15 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 20276 ; free virtual = 118656
INFO: [runtcl-4] Executing : report_drc -file design_1_wrapper_drc_opted.rpt -pb design_1_wrapper_drc_opted.pb -rpx design_1_wrapper_drc_opted.rpx
Command: report_drc -file design_1_wrapper_drc_opted.rpt -pb design_1_wrapper_drc_opted.pb -rpx design_1_wrapper_drc_opted.rpx
INFO: [IP_Flow 19-1839] IP Catalog is up to date.
INFO: [DRC 23-27] Running DRC with 8 threads
INFO: [Vivado_Tcl 2-168] The results of DRC are in file /mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/impl_1/design_1_wrapper_drc_opted.rpt.
report_drc completed successfully
report_drc: Time (s): cpu = 00:00:32 ; elapsed = 00:00:19 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19726 ; free virtual = 118106
Command: place_design
Attempting to get a license for feature 'Implementation' and/or device 'xck26'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xck26'
INFO: [DRC 23-27] Running DRC with 8 threads
INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.
Running DRC as a precondition to command place_design
INFO: [DRC 23-27] Running DRC with 8 threads
INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.

Starting Placer Task
INFO: [Place 30-611] Multithreading enabled for place_design using a maximum of 8 CPUs

Phase 1 Placer Initialization

Phase 1.1 Placer Initialization Netlist Sorting
Netlist sorting complete. Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19720 ; free virtual = 118100
Phase 1.1 Placer Initialization Netlist Sorting | Checksum: 1889f1570

Time (s): cpu = 00:00:00.04 ; elapsed = 00:00:00.04 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19721 ; free virtual = 118101
Netlist sorting complete. Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19722 ; free virtual = 118101

Phase 1.2 IO Placement/ Clock Placement/ Build Placer Device
Phase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: b611837b

Time (s): cpu = 00:00:11 ; elapsed = 00:00:05 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19753 ; free virtual = 118132

Phase 1.3 Build Placer Netlist Model
Phase 1.3 Build Placer Netlist Model | Checksum: 186707a58

Time (s): cpu = 00:00:36 ; elapsed = 00:00:17 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19559 ; free virtual = 117939

Phase 1.4 Constrain Clocks/Macros
Phase 1.4 Constrain Clocks/Macros | Checksum: 186707a58

Time (s): cpu = 00:00:36 ; elapsed = 00:00:17 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19555 ; free virtual = 117935
Phase 1 Placer Initialization | Checksum: 186707a58

Time (s): cpu = 00:00:36 ; elapsed = 00:00:17 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19553 ; free virtual = 117933

Phase 2 Global Placement

Phase 2.1 Floorplanning

Phase 2.1.1 Partition Driven Placement

Phase 2.1.1.1 PBP: Partition Driven Placement
Phase 2.1.1.1 PBP: Partition Driven Placement | Checksum: 1069952a6

Time (s): cpu = 00:01:14 ; elapsed = 00:00:33 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19483 ; free virtual = 117863

Phase 2.1.1.2 PBP: Clock Region Placement
Phase 2.1.1.2 PBP: Clock Region Placement | Checksum: 1ba5e3e60

Time (s): cpu = 00:01:16 ; elapsed = 00:00:35 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19478 ; free virtual = 117858

Phase 2.1.1.3 PBP: Compute Congestion
Phase 2.1.1.3 PBP: Compute Congestion | Checksum: 1ba5e3e60

Time (s): cpu = 00:01:17 ; elapsed = 00:00:36 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19402 ; free virtual = 117782

Phase 2.1.1.4 PBP: UpdateTiming
Phase 2.1.1.4 PBP: UpdateTiming | Checksum: 141e8c566

Time (s): cpu = 00:01:24 ; elapsed = 00:00:39 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19399 ; free virtual = 117779

Phase 2.1.1.5 PBP: Add part constraints
Phase 2.1.1.5 PBP: Add part constraints | Checksum: 141e8c566

Time (s): cpu = 00:01:24 ; elapsed = 00:00:39 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19388 ; free virtual = 117768
Phase 2.1.1 Partition Driven Placement | Checksum: 141e8c566

Time (s): cpu = 00:01:24 ; elapsed = 00:00:39 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19428 ; free virtual = 117808
Phase 2.1 Floorplanning | Checksum: 141e8c566

Time (s): cpu = 00:01:25 ; elapsed = 00:00:40 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19430 ; free virtual = 117810

Phase 2.2 Update Timing before SLR Path Opt
Phase 2.2 Update Timing before SLR Path Opt | Checksum: 141e8c566

Time (s): cpu = 00:01:25 ; elapsed = 00:00:40 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19432 ; free virtual = 117811

Phase 2.3 Post-Processing in Floorplanning
Phase 2.3 Post-Processing in Floorplanning | Checksum: 156f3ef66

Time (s): cpu = 00:01:25 ; elapsed = 00:00:40 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19435 ; free virtual = 117815

Phase 2.4 Global Placement Core

Phase 2.4.1 Physical Synthesis In Placer
INFO: [Physopt 32-1035] Found 297 LUTNM shape to break, 1329 LUT instances to create LUTNM shape
INFO: [Physopt 32-1044] Break lutnm for timing: one critical 164, two critical 133, total 297, new lutff created 21
INFO: [Physopt 32-1138] End 1 Pass. Optimized 871 nets or LUTs. Breaked 297 LUTs, combined 574 existing LUTs and moved 0 existing LUT
INFO: [Physopt 32-1030] Pass 1. Identified 82 candidate driver sets for equivalent driver rewiring.
INFO: [Physopt 32-661] Optimized 51 nets.  Re-placed 217 instances.
INFO: [Physopt 32-775] End 1 Pass. Optimized 51 nets or cells. Created 0 new cell, deleted 7 existing cells and moved 217 existing cells
Netlist sorting complete. Time (s): cpu = 00:00:00.49 ; elapsed = 00:00:00.48 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19426 ; free virtual = 117806
INFO: [Physopt 32-65] No nets found for high-fanout optimization.
INFO: [Physopt 32-232] Optimized 0 net. Created 0 new instance.
INFO: [Physopt 32-775] End 1 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
INFO: [Physopt 32-456] No candidate cells for DSP register optimization found in the design.
INFO: [Physopt 32-775] End 2 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
INFO: [Physopt 32-1123] No candidate cells found for Shift Register to Pipeline optimization
INFO: [Physopt 32-775] End 1 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
INFO: [Physopt 32-677] No candidate cells for Shift Register optimization found in the design
INFO: [Physopt 32-775] End 1 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
INFO: [Physopt 32-526] No candidate cells for BRAM register optimization found in the design
INFO: [Physopt 32-775] End 1 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
INFO: [Physopt 32-846] No candidate cells for URAM register optimization found in the design
INFO: [Physopt 32-775] End 2 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
INFO: [Physopt 32-949] No candidate nets found for dynamic/static region interface net replication
INFO: [Physopt 32-775] End 1 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19438 ; free virtual = 117817

Summary of Physical Synthesis Optimizations
============================================


-----------------------------------------------------------------------------------------------------------------------------------------------------------
|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
|  LUT Combining                                    |          297  |            574  |                   871  |           0  |           1  |  00:00:01  |
|  Retime                                           |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Equivalent Driver Rewiring                       |            0  |              7  |                    51  |           0  |           1  |  00:00:03  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:01  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |          297  |            581  |                   922  |           0  |          10  |  00:00:05  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------


Phase 2.4.1 Physical Synthesis In Placer | Checksum: 1aee71ec2

Time (s): cpu = 00:03:38 ; elapsed = 00:01:37 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19417 ; free virtual = 117797
Phase 2.4 Global Placement Core | Checksum: 129ed9439

Time (s): cpu = 00:03:43 ; elapsed = 00:01:39 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19407 ; free virtual = 117787
Phase 2 Global Placement | Checksum: 129ed9439

Time (s): cpu = 00:03:43 ; elapsed = 00:01:39 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19445 ; free virtual = 117825

Phase 3 Detail Placement

Phase 3.1 Commit Multi Column Macros
Phase 3.1 Commit Multi Column Macros | Checksum: 16db1a6ae

Time (s): cpu = 00:03:51 ; elapsed = 00:01:43 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19429 ; free virtual = 117809

Phase 3.2 Commit Most Macros & LUTRAMs
Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 1b8343cad

Time (s): cpu = 00:03:58 ; elapsed = 00:01:46 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19388 ; free virtual = 117767

Phase 3.3 Small Shape DP

Phase 3.3.1 Small Shape Clustering
Phase 3.3.1 Small Shape Clustering | Checksum: 18a1bfe60

Time (s): cpu = 00:04:12 ; elapsed = 00:01:52 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19309 ; free virtual = 117689

Phase 3.3.2 Flow Legalize Slice Clusters
Phase 3.3.2 Flow Legalize Slice Clusters | Checksum: 1974d03bb

Time (s): cpu = 00:04:12 ; elapsed = 00:01:53 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19313 ; free virtual = 117693

Phase 3.3.3 Slice Area Swap
Phase 3.3.3 Slice Area Swap | Checksum: 1b0661359

Time (s): cpu = 00:04:21 ; elapsed = 00:02:01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18793 ; free virtual = 117172
Phase 3.3 Small Shape DP | Checksum: 154b3cce2

Time (s): cpu = 00:04:40 ; elapsed = 00:02:07 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18830 ; free virtual = 117209

Phase 3.4 Re-assign LUT pins
Phase 3.4 Re-assign LUT pins | Checksum: 123363902

Time (s): cpu = 00:04:45 ; elapsed = 00:02:12 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18850 ; free virtual = 117230

Phase 3.5 Pipeline Register Optimization
Phase 3.5 Pipeline Register Optimization | Checksum: 1ce59ec18

Time (s): cpu = 00:04:46 ; elapsed = 00:02:12 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18858 ; free virtual = 117238

Phase 3.6 Fast Optimization
Phase 3.6 Fast Optimization | Checksum: 13a2a61ab

Time (s): cpu = 00:05:33 ; elapsed = 00:02:28 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18869 ; free virtual = 117249
Phase 3 Detail Placement | Checksum: 13a2a61ab

Time (s): cpu = 00:05:34 ; elapsed = 00:02:29 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18868 ; free virtual = 117248

Phase 4 Post Placement Optimization and Clean-Up

Phase 4.1 Post Commit Optimization
INFO: [Timing 38-35] Done setting XDC timing constraints.

Phase 4.1.1 Post Placement Optimization
Post Placement Optimization Initialization | Checksum: f5ed2629

Phase 4.1.1.1 BUFG Insertion

Starting Physical Synthesis Task

Phase 1 Physical Synthesis Initialization
INFO: [Physopt 32-721] Multithreading enabled for phys_opt_design using a maximum of 8 CPUs
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.791 | TNS=-31.624 |
Phase 1 Physical Synthesis Initialization | Checksum: 1d860ea2f

Time (s): cpu = 00:00:04 ; elapsed = 00:00:00.79 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18947 ; free virtual = 117326
INFO: [Place 46-56] BUFG insertion identified 0 candidate nets. Inserted BUFG: 0, Replicated BUFG Driver: 0, Skipped due to Placement/Routing Conflicts: 0, Skipped due to Timing Degradation: 0, Skipped due to Illegal Netlist: 0.
Ending Physical Synthesis Task | Checksum: 1b56d0c7f

Time (s): cpu = 00:00:04 ; elapsed = 00:00:00.99 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18949 ; free virtual = 117328
Phase 4.1.1.1 BUFG Insertion | Checksum: f5ed2629

Time (s): cpu = 00:06:19 ; elapsed = 00:02:47 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18957 ; free virtual = 117336

Phase 4.1.1.2 Post Placement Timing Optimization
INFO: [Place 30-746] Post Placement Timing Summary WNS=-0.109. For the most accurate timing information please run report_timing.
Phase 4.1.1.2 Post Placement Timing Optimization | Checksum: 1ee510eeb

Time (s): cpu = 00:06:56 ; elapsed = 00:03:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18990 ; free virtual = 117370

Time (s): cpu = 00:06:56 ; elapsed = 00:03:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18991 ; free virtual = 117371
Phase 4.1 Post Commit Optimization | Checksum: 1ee510eeb

Time (s): cpu = 00:06:57 ; elapsed = 00:03:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18993 ; free virtual = 117372
Netlist sorting complete. Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18977 ; free virtual = 117356

Phase 4.2 Post Placement Cleanup
Phase 4.2 Post Placement Cleanup | Checksum: 22d59a393

Time (s): cpu = 00:07:18 ; elapsed = 00:03:36 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18981 ; free virtual = 117361

Phase 4.3 Placer Reporting

Phase 4.3.1 Print Estimated Congestion
INFO: [Place 30-612] Post-Placement Estimated Congestion 
 ________________________________________________________________________
|           | Global Congestion | Long Congestion   | Short Congestion  |
| Direction | Region Size       | Region Size       | Region Size       |
|___________|___________________|___________________|___________________|
|      North|                4x4|                1x1|                1x1|
|___________|___________________|___________________|___________________|
|      South|                1x1|                4x4|                4x4|
|___________|___________________|___________________|___________________|
|       East|                1x1|                1x1|                1x1|
|___________|___________________|___________________|___________________|
|       West|                1x1|                1x1|                4x4|
|___________|___________________|___________________|___________________|

Phase 4.3.1 Print Estimated Congestion | Checksum: 22d59a393

Time (s): cpu = 00:07:18 ; elapsed = 00:03:37 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18977 ; free virtual = 117356
Phase 4.3 Placer Reporting | Checksum: 22d59a393

Time (s): cpu = 00:07:19 ; elapsed = 00:03:37 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18980 ; free virtual = 117359

Phase 4.4 Final Placement Cleanup
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18981 ; free virtual = 117361

Time (s): cpu = 00:07:19 ; elapsed = 00:03:37 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18981 ; free virtual = 117361
Phase 4 Post Placement Optimization and Clean-Up | Checksum: 16d5d1d72

Time (s): cpu = 00:07:19 ; elapsed = 00:03:38 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18971 ; free virtual = 117350
Ending Placer Task | Checksum: 975adfb5

Time (s): cpu = 00:07:19 ; elapsed = 00:03:38 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18970 ; free virtual = 117350
INFO: [Common 17-83] Releasing license: Implementation
104 Infos, 2 Warnings, 0 Critical Warnings and 0 Errors encountered.
place_design completed successfully
place_design: Time (s): cpu = 00:07:24 ; elapsed = 00:03:40 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19156 ; free virtual = 117536
INFO: [Timing 38-480] Writing timing data to binary archive.
Writing placer database...
Writing XDEF routing.
Writing XDEF routing logical nets.
Writing XDEF routing special nets.
Write XDEF Complete: Time (s): cpu = 00:00:11 ; elapsed = 00:00:04 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18977 ; free virtual = 117356
INFO: [Common 17-1381] The checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/impl_1/design_1_wrapper_placed.dcp' has been generated.
write_checkpoint: Time (s): cpu = 00:00:30 ; elapsed = 00:00:18 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19107 ; free virtual = 117487
INFO: [runtcl-4] Executing : report_io -file design_1_wrapper_io_placed.rpt
report_io: Time (s): cpu = 00:00:00.18 ; elapsed = 00:00:00.41 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19088 ; free virtual = 117467
INFO: [runtcl-4] Executing : report_utilization -file design_1_wrapper_utilization_placed.rpt -pb design_1_wrapper_utilization_placed.pb
INFO: [runtcl-4] Executing : report_control_sets -verbose -file design_1_wrapper_control_sets_placed.rpt
report_control_sets: Time (s): cpu = 00:00:00.19 ; elapsed = 00:00:00.44 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19113 ; free virtual = 117492
Command: phys_opt_design
Attempting to get a license for feature 'Implementation' and/or device 'xck26'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xck26'
INFO: [Vivado_Tcl 4-1435] PhysOpt_Tcl_Interface Runtime Before Starting Physical Synthesis Task | CPU: 36.68s |  WALL: 10.96s
Netlist sorting complete. Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19075 ; free virtual = 117454

Starting Physical Synthesis Task

Phase 1 Physical Synthesis Initialization
INFO: [Physopt 32-721] Multithreading enabled for phys_opt_design using a maximum of 8 CPUs
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.105 | TNS=-0.900 |
Phase 1 Physical Synthesis Initialization | Checksum: 20ad294b2

Time (s): cpu = 00:00:14 ; elapsed = 00:00:09 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18983 ; free virtual = 117363
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.105 | TNS=-0.900 |

Phase 2 DSP Register Optimization
INFO: [Physopt 32-456] No candidate cells for DSP register optimization found in the design.
INFO: [Physopt 32-775] End 2 Pass. Optimized 0 net or cell. Created 0 new cell, deleted 0 existing cell and moved 0 existing cell
Phase 2 DSP Register Optimization | Checksum: 20ad294b2

Time (s): cpu = 00:00:14 ; elapsed = 00:00:09 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18988 ; free virtual = 117367

Phase 3 Critical Path Optimization
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.105 | TNS=-0.900 |
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/RAM/RDATA[32]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-663] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/Q[12].  Re-placed instance design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/flow_counter_reg[12]
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/Q[12]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.101 | TNS=-0.842 |
INFO: [Physopt 32-663] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/Q[13].  Re-placed instance design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/flow_counter_reg[13]
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/Q[13]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.078 | TNS=-0.539 |
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/Q[12]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.O_PORT/INTAKE_CTRL.curr_read_ptr_reg[12]_0[1]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.O_PORT/INTAKE_CTRL.curr_read_ptr_reg[7]_i_2__11_n_0. Optimizations did not improve timing on the net.
INFO: [Physopt 32-608] Optimized 1 net.  Swapped 37 pins.
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/INTAKE_CTRL.curr_read_ptr_reg[4][4]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.061 | TNS=-0.414 |
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/I_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/flow_counter_reg[13]_0[9]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/I_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/O[1]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/I_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/next_counter0__0_carry_n_0. Optimizations did not improve timing on the net.
INFO: [Physopt 32-608] Optimized 1 net.  Swapped 79 pins.
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/flow_counter_reg[7]_0[3]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.053 | TNS=-0.200 |
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/INTAKE_CTRL.curr_read_ptr_reg[4][4]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-663] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/o_pull_fin_size[4].  Re-placed instance design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/i___60
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/o_pull_fin_size[4]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.043 | TNS=-0.169 |
INFO: [Physopt 32-710] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/INTAKE_CTRL.curr_read_ptr_reg[4][4]. Critical path length was reduced through logic transformation on cell design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/O_SIDE.VALVE/INTAKE_CTRL.curr_read_ptr[7]_i_3__11_comp.
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[12].READER/CTRL/o_pull_fin_size[4]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.038 | TNS=-0.106 |
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/I_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/flow_counter_reg[13]_0[9]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-571] Net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/Q[12] was not replicated.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/Q[12]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/I_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/O[1]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/I_SIDE/VALVE/GEN_NON_FIXED_CLOSE.VALVE/next_counter0__0_carry_n_0. Optimizations did not improve timing on the net.
INFO: [Physopt 32-608] Optimized 1 net.  Swapped 79 pins.
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/flow_counter_reg[7]_0[3]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=-0.009 | TNS=-0.009 |
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/RAM/RDATA[32]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.O_PORT/INTAKE_CTRL.curr_read_ptr_reg[12]_0[1]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.O_PORT/INTAKE_CTRL.curr_read_ptr_reg[7]_i_2__12_n_0. Optimizations did not improve timing on the net.
INFO: [Physopt 32-702] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/INTAKE_CTRL.curr_read_ptr_reg[4][4]. Optimizations did not improve timing on the net.
INFO: [Physopt 32-710] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/INTAKE_CTRL.curr_read_ptr_reg[4][4]. Critical path length was reduced through logic transformation on cell design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/INTAKE_CTRL.curr_read_ptr[7]_i_3__12_comp.
INFO: [Physopt 32-735] Processed net design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/o_pull_fin_size[4]. Optimization improves timing on the net.
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=0.000 | TNS=0.000 |
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=0.000 | TNS=0.000 |
Phase 3 Critical Path Optimization | Checksum: 20ad294b2

Time (s): cpu = 00:00:22 ; elapsed = 00:00:13 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19002 ; free virtual = 117381

Phase 4 Critical Path Optimization
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=0.000 | TNS=0.000 |
INFO: [Physopt 32-619] Estimated Timing Summary | WNS=0.000 | TNS=0.000 |
Phase 4 Critical Path Optimization | Checksum: 20ad294b2

Time (s): cpu = 00:00:22 ; elapsed = 00:00:13 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19002 ; free virtual = 117381
Netlist sorting complete. Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.03 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19008 ; free virtual = 117388
Netlist sorting complete. Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19013 ; free virtual = 117393
INFO: [Physopt 32-603] Post Physical Optimization Timing Summary | WNS=0.000 | TNS=0.000 |

Summary of Physical Synthesis Optimizations
============================================


-------------------------------------------------------------------------------------------------------------------------------------------------------------
|  Optimization   |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
|  DSP Register   |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Path  |          0.105  |          0.900  |            0  |              0  |                     8  |           0  |           2  |  00:00:04  |
|  Total          |          0.105  |          0.900  |            0  |              0  |                     8  |           0  |           3  |  00:00:04  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------


Netlist sorting complete. Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19017 ; free virtual = 117397
Ending Physical Synthesis Task | Checksum: 1e44a7ffa

Time (s): cpu = 00:00:24 ; elapsed = 00:00:14 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19010 ; free virtual = 117390
INFO: [Common 17-83] Releasing license: Implementation
163 Infos, 2 Warnings, 0 Critical Warnings and 0 Errors encountered.
phys_opt_design completed successfully
phys_opt_design: Time (s): cpu = 00:01:00 ; elapsed = 00:00:25 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19130 ; free virtual = 117509
INFO: [Timing 38-480] Writing timing data to binary archive.
Writing placer database...
Writing XDEF routing.
Writing XDEF routing logical nets.
Writing XDEF routing special nets.
Write XDEF Complete: Time (s): cpu = 00:00:10 ; elapsed = 00:00:03 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18946 ; free virtual = 117326
INFO: [Common 17-1381] The checkpoint '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/impl_1/design_1_wrapper_physopt.dcp' has been generated.
write_checkpoint: Time (s): cpu = 00:00:28 ; elapsed = 00:00:17 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 19062 ; free virtual = 117442
Command: route_design
Attempting to get a license for feature 'Implementation' and/or device 'xck26'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xck26'
INFO: [DRC 23-27] Running DRC with 8 threads
INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.
Running DRC as a precondition to command route_design
INFO: [DRC 23-27] Running DRC with 8 threads
INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.


Starting Routing Task
INFO: [Route 35-254] Multithreading enabled for route_design using a maximum of 8 CPUs

Phase 1 Build RT Design
Checksum: PlaceDB: ff372d59 ConstDB: 0 ShapeSum: 48167460 RouteDB: 92661af9
Nodegraph reading from file.  Time (s): cpu = 00:00:00.45 ; elapsed = 00:00:00.50 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18951 ; free virtual = 117331
Post Restoration Checksum: NetGraph: fd7f8f95 NumContArr: ffa311fd Constraints: c339631f Timing: 0
Phase 1 Build RT Design | Checksum: 2c05c04b1

Time (s): cpu = 00:00:47 ; elapsed = 00:00:10 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18958 ; free virtual = 117338

Phase 2 Router Initialization

Phase 2.1 Fix Topology Constraints
Phase 2.1 Fix Topology Constraints | Checksum: 2c05c04b1

Time (s): cpu = 00:00:48 ; elapsed = 00:00:10 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18893 ; free virtual = 117273

Phase 2.2 Pre Route Cleanup
Phase 2.2 Pre Route Cleanup | Checksum: 2c05c04b1

Time (s): cpu = 00:00:48 ; elapsed = 00:00:10 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18892 ; free virtual = 117271

Phase 2.3 Global Clock Net Routing
 Number of Nodes with overlaps = 0
Phase 2.3 Global Clock Net Routing | Checksum: 21cb749f9

Time (s): cpu = 00:00:53 ; elapsed = 00:00:13 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18870 ; free virtual = 117249

Phase 2.4 Update Timing
Phase 2.4 Update Timing | Checksum: 28f593330

Time (s): cpu = 00:01:19 ; elapsed = 00:00:23 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18804 ; free virtual = 117184
INFO: [Route 35-416] Intermediate Timing Summary | WNS=0.079  | TNS=0.000  | WHS=-0.091 | THS=-168.004|


Router Utilization Summary
  Global Vertical Routing Utilization    = 0 %
  Global Horizontal Routing Utilization  = 0 %
  Routable Net Status*
  *Does not include unroutable nets such as driverless and loadless.
  Run report_route_status for detailed report.
  Number of Failed Nets               = 85431
    (Failed Nets is the sum of unrouted and partially routed nets)
  Number of Unrouted Nets             = 70833
  Number of Partially Routed Nets     = 14598
  Number of Node Overlaps             = 0

Phase 2 Router Initialization | Checksum: 30d8336ee

Time (s): cpu = 00:01:56 ; elapsed = 00:00:34 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18789 ; free virtual = 117168

Phase 3 Initial Routing

Phase 3.1 Global Routing
Phase 3.1 Global Routing | Checksum: 30d8336ee

Time (s): cpu = 00:01:56 ; elapsed = 00:00:34 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18788 ; free virtual = 117168
Phase 3 Initial Routing | Checksum: f08a204f

Time (s): cpu = 00:02:28 ; elapsed = 00:00:46 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18738 ; free virtual = 117118

Phase 4 Rip-up And Reroute

Phase 4.1 Global Iteration 0
 Number of Nodes with overlaps = 14748
 Number of Nodes with overlaps = 859
 Number of Nodes with overlaps = 103
 Number of Nodes with overlaps = 27
 Number of Nodes with overlaps = 10
 Number of Nodes with overlaps = 1
 Number of Nodes with overlaps = 0
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.268 | TNS=-4.685 | WHS=-0.057 | THS=-1.097 |

Phase 4.1 Global Iteration 0 | Checksum: 2408151a2

Time (s): cpu = 00:04:39 ; elapsed = 00:01:42 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18758 ; free virtual = 117138

Phase 4.2 Global Iteration 1
 Number of Nodes with overlaps = 619
 Number of Nodes with overlaps = 62
 Number of Nodes with overlaps = 23
 Number of Nodes with overlaps = 4
 Number of Nodes with overlaps = 0
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.180 | TNS=-1.015 | WHS=N/A    | THS=N/A    |

Phase 4.2 Global Iteration 1 | Checksum: 234311bcb

Time (s): cpu = 00:05:04 ; elapsed = 00:02:00 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18787 ; free virtual = 117166

Phase 4.3 Global Iteration 2
 Number of Nodes with overlaps = 1026
 Number of Nodes with overlaps = 107
 Number of Nodes with overlaps = 28
 Number of Nodes with overlaps = 7
 Number of Nodes with overlaps = 2
 Number of Nodes with overlaps = 0
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.071 | TNS=-0.386 | WHS=N/A    | THS=N/A    |

Phase 4.3 Global Iteration 2 | Checksum: 2421fc34b

Time (s): cpu = 00:05:34 ; elapsed = 00:02:22 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18781 ; free virtual = 117160

Phase 4.4 Global Iteration 3
 Number of Nodes with overlaps = 983
 Number of Nodes with overlaps = 54
 Number of Nodes with overlaps = 13
 Number of Nodes with overlaps = 5
 Number of Nodes with overlaps = 1
 Number of Nodes with overlaps = 0
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.034 | TNS=-0.062 | WHS=N/A    | THS=N/A    |

Phase 4.4 Global Iteration 3 | Checksum: 286685c06

Time (s): cpu = 00:06:03 ; elapsed = 00:02:45 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18785 ; free virtual = 117164

Phase 4.5 Global Iteration 4
 Number of Nodes with overlaps = 772
 Number of Nodes with overlaps = 56
 Number of Nodes with overlaps = 8
 Number of Nodes with overlaps = 5
 Number of Nodes with overlaps = 2
 Number of Nodes with overlaps = 0
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.013 | TNS=-0.031 | WHS=N/A    | THS=N/A    |

Phase 4.5 Global Iteration 4 | Checksum: 2f0e4fba6

Time (s): cpu = 00:06:27 ; elapsed = 00:03:03 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18792 ; free virtual = 117172

Phase 4.6 Global Iteration 5
 Number of Nodes with overlaps = 621
 Number of Nodes with overlaps = 34
 Number of Nodes with overlaps = 11
 Number of Nodes with overlaps = 8
 Number of Nodes with overlaps = 4
 Number of Nodes with overlaps = 3
 Number of Nodes with overlaps = 2
 Number of Nodes with overlaps = 1
 Number of Nodes with overlaps = 0
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.041 | TNS=-0.076 | WHS=N/A    | THS=N/A    |

Phase 4.6 Global Iteration 5 | Checksum: aa8f9a1f

Time (s): cpu = 00:06:50 ; elapsed = 00:03:22 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18790 ; free virtual = 117170
Phase 4 Rip-up And Reroute | Checksum: aa8f9a1f

Time (s): cpu = 00:06:50 ; elapsed = 00:03:22 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18791 ; free virtual = 117171

Phase 5 Delay and Skew Optimization

Phase 5.1 Delay CleanUp

Phase 5.1.1 Update Timing
Phase 5.1.1 Update Timing | Checksum: 1fcde04ac

Time (s): cpu = 00:07:12 ; elapsed = 00:03:31 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18791 ; free virtual = 117171
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.013 | TNS=-0.031 | WHS=0.010  | THS=0.000  |

 Number of Nodes with overlaps = 0
Phase 5.1 Delay CleanUp | Checksum: 2fb8ebf31

Time (s): cpu = 00:07:15 ; elapsed = 00:03:32 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18788 ; free virtual = 117168

Phase 5.2 Clock Skew Optimization
Phase 5.2 Clock Skew Optimization | Checksum: 2fb8ebf31

Time (s): cpu = 00:07:15 ; elapsed = 00:03:32 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18788 ; free virtual = 117168
Phase 5 Delay and Skew Optimization | Checksum: 2fb8ebf31

Time (s): cpu = 00:07:15 ; elapsed = 00:03:32 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18788 ; free virtual = 117168

Phase 6 Post Hold Fix

Phase 6.1 Hold Fix Iter

Phase 6.1.1 Update Timing
Phase 6.1.1 Update Timing | Checksum: 32f7b6a92

Time (s): cpu = 00:07:32 ; elapsed = 00:03:39 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18799 ; free virtual = 117178
INFO: [Route 35-416] Intermediate Timing Summary | WNS=-0.013 | TNS=-0.023 | WHS=0.010  | THS=0.000  |

Phase 6.1 Hold Fix Iter | Checksum: 2ffb9e015

Time (s): cpu = 00:07:32 ; elapsed = 00:03:39 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18799 ; free virtual = 117179
Phase 6 Post Hold Fix | Checksum: 2ffb9e015

Time (s): cpu = 00:07:33 ; elapsed = 00:03:40 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18797 ; free virtual = 117177

Phase 7 Route finalize

Router Utilization Summary
  Global Vertical Routing Utilization    = 14.4302 %
  Global Horizontal Routing Utilization  = 12.0243 %
  Routable Net Status*
  *Does not include unroutable nets such as driverless and loadless.
  Run report_route_status for detailed report.
  Number of Failed Nets               = 0
    (Failed Nets is the sum of unrouted and partially routed nets)
  Number of Unrouted Nets             = 0
  Number of Partially Routed Nets     = 0
  Number of Node Overlaps             = 0

Congestion Report
North Dir 1x1 Area, Max Cong = 62.9108%, No Congested Regions.
South Dir 1x1 Area, Max Cong = 82.4645%, No Congested Regions.
East Dir 1x1 Area, Max Cong = 75.9615%, No Congested Regions.
West Dir 1x1 Area, Max Cong = 63.4615%, No Congested Regions.

------------------------------
Reporting congestion hotspots
------------------------------
Direction: North
----------------
Congested clusters found at Level 0
Effective congestion level: 0 Aspect Ratio: 1 Sparse Ratio: 0
Direction: South
----------------
Congested clusters found at Level 0
Effective congestion level: 0 Aspect Ratio: 1 Sparse Ratio: 0
Direction: East
----------------
Congested clusters found at Level 0
Effective congestion level: 0 Aspect Ratio: 1 Sparse Ratio: 0
Direction: West
----------------
Congested clusters found at Level 0
Effective congestion level: 0 Aspect Ratio: 1 Sparse Ratio: 0

Phase 7 Route finalize | Checksum: 33efa38a9

Time (s): cpu = 00:07:34 ; elapsed = 00:03:40 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18800 ; free virtual = 117179

Phase 8 Verifying routed nets

 Verification completed successfully
Phase 8 Verifying routed nets | Checksum: 33efa38a9

Time (s): cpu = 00:07:34 ; elapsed = 00:03:41 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18801 ; free virtual = 117180

Phase 9 Depositing Routes
Phase 9 Depositing Routes | Checksum: 33efa38a9

Time (s): cpu = 00:07:42 ; elapsed = 00:03:46 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18797 ; free virtual = 117177

Phase 10 Resolve XTalk
Phase 10 Resolve XTalk | Checksum: 33efa38a9

Time (s): cpu = 00:07:42 ; elapsed = 00:03:47 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18803 ; free virtual = 117183

Phase 11 Post Router Timing
INFO: [Route 35-57] Estimated Timing Summary | WNS=-0.013 | TNS=-0.023 | WHS=0.010  | THS=0.000  |

WARNING: [Route 35-328] Router estimated timing not met.
Resolution: For a complete and accurate timing signoff, report_timing_summary must be run after route_design. Alternatively, route_design can be run with the -timing_summary option to enable a complete timing signoff at the end of route_design.
Phase 11 Post Router Timing | Checksum: 33efa38a9

Time (s): cpu = 00:07:50 ; elapsed = 00:03:48 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18814 ; free virtual = 117193
Time taken to check if laguna hold fix is required (in secs): 0

Phase 12 Physical Synthesis in Router

Phase 12.1 Physical Synthesis Initialization
INFO: [Physopt 32-668] Current Timing Summary | WNS=-0.013 | TNS=-0.023 | WHS=0.010 | THS=0.000 |
Phase 12.1 Physical Synthesis Initialization | Checksum: 33efa38a9

Time (s): cpu = 00:08:36 ; elapsed = 00:04:01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18704 ; free virtual = 117084

Phase 12.2 Critical Path Optimization
INFO: [Physopt 32-668] Current Timing Summary | WNS=-0.013 | TNS=-0.023 | WHS=0.010 | THS=0.000 |
INFO: [Physopt 32-952] Improved path group WNS = -0.008. Path group: clk_out1_design_1_clk_wiz_0_0. Processed net: design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[15].READER/RAM/RDATA[96].
INFO: [Physopt 32-952] Improved path group WNS = -0.005. Path group: clk_out1_design_1_clk_wiz_0_0. Processed net: design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/RAM/RDATA[32].
INFO: [Physopt 32-953] Path group WNS did not improve. Path group: clk_out1_design_1_clk_wiz_0_0. Processed net: design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/flow_eq_zero_reg_0.
INFO: [Physopt 32-953] Path group WNS did not improve. Path group: clk_out1_design_1_clk_wiz_0_0. Processed net: design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/Q[12].
INFO: [Physopt 32-953] Path group WNS did not improve. Path group: clk_out1_design_1_clk_wiz_0_0. Processed net: design_1_i/ArgSort_AXI_1/U0/ARGSORT_IF/MRG_RD/MRG[13].READER/CTRL/O_SIDE.VALVE/flow_eq_zero_i_2__13_n_0.
INFO: [Physopt 32-668] Current Timing Summary | WNS=-0.005 | TNS=-0.005 | WHS=0.010 | THS=0.000 |
Phase 12.2 Critical Path Optimization | Checksum: 33efa38a9

Time (s): cpu = 00:08:45 ; elapsed = 00:04:03 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18703 ; free virtual = 117083
Netlist sorting complete. Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18701 ; free virtual = 117081
INFO: [Physopt 32-669] Post Physical Optimization Timing Summary | WNS=-0.005 | TNS=-0.005 | WHS=0.010 | THS=0.000 |
Phase 12 Physical Synthesis in Router | Checksum: 234172465

Time (s): cpu = 00:08:46 ; elapsed = 00:04:04 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18700 ; free virtual = 117080
INFO: [Route 35-16] Router Completed Successfully

Time (s): cpu = 00:08:46 ; elapsed = 00:04:04 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 18815 ; free virtual = 117195
Abnormal program termination (11)
Please check '/mnt/d/ichiro/work/ArgSort-Kv260-Vivado-Abort/argsort_16_2_0/project.runs/impl_1/hs_err_pid27618.log' for details
segfault in /home/ichiro/Xilinx/Vivado/2021.2/bin/unwrapped/lnx64.o/vivado -exec vivado -log design_1_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source design_1_wrapper.tcl -notrace, exiting...
[Tue May 20 12:50:47 2025] impl_1 finished
WARNING: [Vivado 12-8222] Failed run(s) : 'impl_1'
wait_on_runs: Time (s): cpu = 00:21:08 ; elapsed = 00:10:49 . Memory (MB): peak = 0.000 ; gain = 0.000 ; free physical = 22655 ; free virtual = 121035
# open_run    impl_1
ERROR: [Common 17-69] Command failed: Run 'impl_1' failed. Unable to open
INFO: [Common 17-206] Exiting Vivado at Tue May 20 12:50:47 2025...
make: *** [../argsort_template/common.mk:41: project.runs/impl_1/design_1_wrapper.bit] Error 1
```

hs_err_pid27618.log

```text:hs_err_pid27618.log
#
# An unexpected error has occurred (11)
#
Stack:
/lib/x86_64-linux-gnu/libc.so.6(+0x43090) [0x7f915b703090]
/lib/x86_64-linux-gnu/libc.so.6(malloc_usable_size+0x48) [0x7f915b75c1f8]
/lib/x86_64-linux-gnu/libudev.so.1(+0x10319) [0x7f90f4bb0319]
/lib/x86_64-linux-gnu/libudev.so.1(+0x167c4) [0x7f90f4bb67c4]
/lib/x86_64-linux-gnu/libudev.so.1(+0x1b255) [0x7f90f4bbb255]
/lib/x86_64-linux-gnu/libudev.so.1(+0x1b4bb) [0x7f90f4bbb4bb]
/lib/x86_64-linux-gnu/libudev.so.1(udev_enumerate_scan_devices+0x294) [0x7f90f4bbdd84]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libXil_lmgr11.so(+0x129015) [0x7f9153169015]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libXil_lmgr11.so(xilinxd_52bd866351b78202+0x9) [0x7f9153169499]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libXil_lmgr11.so(+0xd6317) [0x7f9153116317]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libXil_lmgr11.so(xilinxd_52bd862318b59a70+0x86) [0x7f91531160d6]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libXil_lmgr11.so(+0xc364f) [0x7f915310364f]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libXil_lmgr11.so(xilinxd_52bd9e9e1c8e52fb+0x1b) [0x7f915310d3eb]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libXil_lmgr11.so(xilinxd_52bd700d1bd3c616+0x30) [0x7f915310d480]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commonxillic.so(XilReg::Utils::GetHostInfo[abi:cxx11](XilReg::Utils::HostInfoType, bool) const+0x1c8) [0x7f91574e76d8]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commonxillic.so(XilReg::Utils::GetHostInfoFormatted[abi:cxx11](XilReg::Utils::HostInfoType, bool) const+0x52) [0x7f91574eb2e2]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commonxillic.so(XilReg::Utils::GetHostInfo[abi:cxx11]() const+0x183) [0x7f91574eb5a3]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commonxillic.so(XilReg::Utils::GetRegInfo(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, bool, bool)+0xc6) [0x7f91574f8856]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commonxillic.so(XilReg::Utils::GetRegInfoWebTalk(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)+0x60) [0x7f91574f8ae0]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_project.so(HAPRWebtalkHelper::getRegistrationId[abi:cxx11]() const+0x3a) [0x7f91191f63da]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_project.so(HAPRWebtalkHelper::HAPRWebtalkHelper(HAPRProject*, HAPRDesign*, HWEWebtalkMgr*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)+0x158) [0x7f91191f6cd8]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_project.so(HAPRDesign::prepAndTransmitWebtalkData(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, bool)+0x69) [0x7f911908d299]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_vivadotasks.so(+0x5df30f) [0x7f910166f30f]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_vivadotasks.so(+0x5e21d9) [0x7f91016721d9]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_common.so(+0xa80712) [0x7f915c990712]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x3356f) [0x7f9156d1356f]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x76945) [0x7f9156d56945]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x7e0f9) [0x7f9156d5e0f9]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(TclEvalObjEx+0x76) [0x7f9156d15216]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commontasks.so(+0x1ebea4) [0x7f91501fbea4]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x3356f) [0x7f9156d1356f]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x34bf8) [0x7f9156d14bf8]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0xad566) [0x7f9156d8d566]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x34785) [0x7f9156d14785]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(Tcl_EvalEx+0x13) [0x7f9156d15163]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(Tcl_FSEvalFileEx+0x1da) [0x7f9156d79d2a]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commontasks.so(+0x2082ed) [0x7f91502182ed]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_common.so(+0xa80712) [0x7f915c990712]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x3356f) [0x7f9156d1356f]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(Tcl_EvalObjv+0x32) [0x7f9156d136a2]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(TclEvalObjEx+0x322) [0x7f9156d154c2]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commontasks.so(+0x24d299) [0x7f915025d299]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commontasks.so(+0x24ed0e) [0x7f915025ed0e]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_common.so(+0xa80712) [0x7f915c990712]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(+0x3356f) [0x7f9156d1356f]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(Tcl_EvalObjv+0x32) [0x7f9156d136a2]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(TclEvalObjEx+0x322) [0x7f9156d154c2]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_commonmain.so(+0xce23) [0x7f915bcfce23]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/libtcl8.5.so(Tcl_Main+0x1d0) [0x7f9156d802f0]
/home/ichiro/Xilinx/Vivado/2021.2/lib/lnx64.o/librdi_common.so(+0xac239b) [0x7f915c9d239b]
/lib/x86_64-linux-gnu/libpthread.so.0(+0x8609) [0x7f915b6a5609]
/lib/x86_64-linux-gnu/libc.so.6(clone+0x43) [0x7f915b7df353]
```

