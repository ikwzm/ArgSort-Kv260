-----------------------------------------------------------------------------------
--!     @file    interface.vhd
--!     @brief   Merge Sorter Interface Package :
--!     @version 0.9.1
--!     @date    2020/11/19
--!     @author  Ichiro Kawazome <ichiro_k@ca2.so-net.ne.jp>
-----------------------------------------------------------------------------------
--
--      Copyright (C) 2018-2020 Ichiro Kawazome
--      All rights reserved.
--
--      Redistribution and use in source and binary forms, with or without
--      modification, are permitted provided that the following conditions
--      are met:
--
--        1. Redistributions of source code must retain the above copyright
--           notice, this list of conditions and the following disclaimer.
--
--        2. Redistributions in binary form must reproduce the above copyright
--           notice, this list of conditions and the following disclaimer in
--           the documentation and/or other materials provided with the
--           distribution.
--
--      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
--      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
--      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
--      A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
--      OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
--      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
--      LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
--      DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
--      THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
--      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
--      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-----------------------------------------------------------------------------------
library ieee;
use     ieee.std_logic_1164.all;
package Interface is

    -------------------------------------------------------------------------------
    -- Interface Register Field Type
    -------------------------------------------------------------------------------
    type      Regs_Field_Type  is record
                  BITS              :  integer;
                  BASE_ADDR         :  integer;
                  REGS_LO           :  integer;
                  REGS_HI           :  integer;
                  ADDR_BASE_ADDR    :  integer;
                  ADDR_BITS         :  integer;
                  ADDR_LO           :  integer;
                  ADDR_HI           :  integer;
                  SIZE_BASE_ADDR    :  integer;
                  SIZE_BITS         :  integer;
                  SIZE_LO           :  integer;
                  SIZE_HI           :  integer;
                  MODE_BASE_ADDR    :  integer;
                  MODE_BITS         :  integer;
                  MODE_HI           :  integer;
                  MODE_LO           :  integer;
                  MODE_SAFETY_POS   :  integer;
                  MODE_SPECUL_POS   :  integer;
                  MODE_AID_LO       :  integer;
                  MODE_AID_HI       :  integer;
                  MODE_AUSER_HI     :  integer;
                  MODE_AUSER_LO     :  integer;
                  MODE_APROT_HI     :  integer;
                  MODE_APROT_LO     :  integer;
                  MODE_CACHE_HI     :  integer;
                  MODE_CACHE_LO     :  integer;
                  MODE_CLOSE_POS    :  integer;
                  MODE_ERROR_POS    :  integer;
                  MODE_DONE_POS     :  integer;
                  STAT_BASE_ADDR    :  integer;
                  STAT_BITS         :  integer;
                  STAT_LO           :  integer;
                  STAT_HI           :  integer;
                  STAT_RESV_BITS    :  integer;
                  STAT_RESV_HI      :  integer;
                  STAT_RESV_LO      :  integer;
                  STAT_CLOSE_POS    :  integer;
                  STAT_ERROR_POS    :  integer;
                  STAT_DONE_POS     :  integer;
                  CTRL_BASE_ADDR    :  integer;
                  CTRL_BITS         :  integer;
                  CTRL_LO           :  integer;
                  CTRL_HI           :  integer;
                  CTRL_RESET_POS    :  integer;
                  CTRL_PAUSE_POS    :  integer;
                  CTRL_STOP_POS     :  integer;
                  CTRL_START_POS    :  integer;
                  CTRL_EBLK_POS     :  integer;
                  CTRL_DONE_POS     :  integer;
                  CTRL_FIRST_POS    :  integer;
                  CTRL_LAST_POS     :  integer;
    end record;
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    function  New_Regs_Field_Type return Regs_Field_Type;
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    constant  Default_Regs_Param : Regs_Field_Type := New_Regs_Field_Type;
    
end Interface;
-----------------------------------------------------------------------------------
--
-----------------------------------------------------------------------------------
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
package body Interface is
    -------------------------------------------------------------------------------
    --           31            24              16               8               0
    --           +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    -- Addr=0x00 |                       Address[31:00]                          |
    --           +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    -- Addr=0x04 |                       Address[63:31]                          |
    --           +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    -- Addr=0x08 |                          Size[31:00]                          |
    --           +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    -- Addr=0x0C | Control[7:0]  |  Status[7:0]  |          Mode[15:00]          |
    --           +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    -------------------------------------------------------------------------------

    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    function  New_Regs_Field_Type return Regs_Field_Type is
        variable  regs_field  :  Regs_Field_Type;
    begin
        ---------------------------------------------------------------------------
        --
        ---------------------------------------------------------------------------
        regs_field.BASE_ADDR      := 16#00#;
        regs_field.REGS_LO        := 0;
        regs_field.REGS_HI        := 127;
        regs_field.BITS           := 128;
        ---------------------------------------------------------------------------
        -- Address Register
        ---------------------------------------------------------------------------
        -- Address     = ????????????????????????.
        ---------------------------------------------------------------------------
        regs_field.ADDR_BASE_ADDR := regs_field.BASE_ADDR + 16#00#;
        regs_field.ADDR_BITS      := 64;
        regs_field.ADDR_LO        := 8*regs_field.ADDR_BASE_ADDR;
        regs_field.ADDR_HI        := 8*regs_field.ADDR_BASE_ADDR + regs_field.ADDR_BITS - 1;
        ---------------------------------------------------------------------------
        -- Size Register
        ---------------------------------------------------------------------------
        -- Size[31:00] = ???????????????.
        ---------------------------------------------------------------------------
        regs_field.SIZE_BASE_ADDR := regs_field.BASE_ADDR + 16#08#;
        regs_field.SIZE_BITS      := 32;
        regs_field.SIZE_LO        := 8*regs_field.SIZE_BASE_ADDR;
        regs_field.SIZE_HI        := 8*regs_field.SIZE_BASE_ADDR + regs_field.SIZE_BITS - 1;
        ---------------------------------------------------------------------------
        -- Mode Register
        ---------------------------------------------------------------------------
        -- Mode[15]    = 1:AXI4 Master I/F ???????????????????????????????????????.
        -- Mode[14]    = 1:AXI4 Master I/F ??????????????????????????????.
        -- Mode[13]    = AXI4 Master I/F ??? AXID[0] ?????????????????????.
        -- Mode[11]    = AXI4 Master I/F ??? ARUSER[0] ?????????????????????.
        -- Mode[10:08] = AXI4 Master I/F ??? APORT[2:0] ?????????????????????.
        -- Mode[07:04] = AXI4 Master I/F ??? ACHACHE[3:0]???????????????.
        -- Mode[03]    = ??????.
        -- Mode[02]    = 1:???????????????(Status[2]='1')??????????????????????????????.
        -- Mode[01]    = 1:??????????????????(Status[1]='1')??????????????????????????????.
        -- Mode[00]    = 1:???????????????(Status[0]='1')??????????????????????????????.
        -------------------------------------------------------------------------------
        regs_field.MODE_BASE_ADDR := regs_field.BASE_ADDR + 16#0C#;
        regs_field.MODE_BITS      := 16;
        regs_field.MODE_HI        := 8*regs_field.MODE_BASE_ADDR + 15;
        regs_field.MODE_LO        := 8*regs_field.MODE_BASE_ADDR +  0;
        regs_field.MODE_SAFETY_POS:= 8*regs_field.MODE_BASE_ADDR + 15;
        regs_field.MODE_SPECUL_POS:= 8*regs_field.MODE_BASE_ADDR + 14;
        regs_field.MODE_AID_HI    := 8*regs_field.MODE_BASE_ADDR + 13;
        regs_field.MODE_AID_LO    := 8*regs_field.MODE_BASE_ADDR + 13;
        regs_field.MODE_AUSER_HI  := 8*regs_field.MODE_BASE_ADDR + 11;
        regs_field.MODE_AUSER_LO  := 8*regs_field.MODE_BASE_ADDR + 11;
        regs_field.MODE_APROT_HI  := 8*regs_field.MODE_BASE_ADDR + 10;
        regs_field.MODE_APROT_LO  := 8*regs_field.MODE_BASE_ADDR +  8;
        regs_field.MODE_CACHE_HI  := 8*regs_field.MODE_BASE_ADDR +  7;
        regs_field.MODE_CACHE_LO  := 8*regs_field.MODE_BASE_ADDR +  4;
        regs_field.MODE_CLOSE_POS := 8*regs_field.MODE_BASE_ADDR +  2;
        regs_field.MODE_ERROR_POS := 8*regs_field.MODE_BASE_ADDR +  1;
        regs_field.MODE_DONE_POS  := 8*regs_field.MODE_BASE_ADDR +  0;
        ---------------------------------------------------------------------------
        -- Status Register
        ---------------------------------------------------------------------------
        -- Status[7:3] = ??????.
        -- Status[2]   = ????????????????????????????????????
        -- Status[1]   = ???????????????????????????????????????.
        -- Status[0]   = ????????????????????? Control[2]='1' ?????????????????????.
        ---------------------------------------------------------------------------
        regs_field.STAT_BASE_ADDR := regs_field.BASE_ADDR + 16#0E#;
        regs_field.STAT_BITS      := 8;
        regs_field.STAT_HI        := 8*regs_field.STAT_BASE_ADDR +  7;
        regs_field.STAT_LO        := 8*regs_field.STAT_BASE_ADDR +  0;
        regs_field.STAT_RESV_HI   := 8*regs_field.STAT_BASE_ADDR +  7;
        regs_field.STAT_RESV_LO   := 8*regs_field.STAT_BASE_ADDR +  3;
        regs_field.STAT_CLOSE_POS := 8*regs_field.STAT_BASE_ADDR +  2;
        regs_field.STAT_ERROR_POS := 8*regs_field.STAT_BASE_ADDR +  1;
        regs_field.STAT_DONE_POS  := 8*regs_field.STAT_BASE_ADDR +  0;
        regs_field.STAT_RESV_BITS := regs_field.STAT_RESV_HI - regs_field.STAT_RESV_LO + 1;
        ---------------------------------------------------------------------------
        -- Control Register
        ---------------------------------------------------------------------------
        -- Control[7]  = 1:????????????????????????????????????. 0:???????????????????????????.
        -- Control[6]  = 1:???????????????????????????.       0:?????????????????????.
        -- Control[5]  = 1:?????????????????????.           0:????????????.
        -- Control[4]  = 1:?????????????????????.           0:????????????.
        -- Control[3]  = 1:???????????????????????????????????????????????????.
        -- Control[2]  = 1:??????????????????Status[0]?????????????????????.
        -- Control[1]  = 1:????????????????????????????????????????????????????????????.
        -- Control[0]  = 1:????????????????????????????????????????????????????????????.
        ---------------------------------------------------------------------------
        regs_field.CTRL_BASE_ADDR  := regs_field.BASE_ADDR + 16#0F#;
        regs_field.CTRL_BITS       := 8;
        regs_field.CTRL_HI         := 8*regs_field.CTRL_BASE_ADDR +  7;
        regs_field.CTRL_LO         := 8*regs_field.CTRL_BASE_ADDR +  0;
        regs_field.CTRL_RESET_POS  := 8*regs_field.CTRL_BASE_ADDR +  7;
        regs_field.CTRL_PAUSE_POS  := 8*regs_field.CTRL_BASE_ADDR +  6;
        regs_field.CTRL_STOP_POS   := 8*regs_field.CTRL_BASE_ADDR +  5;
        regs_field.CTRL_START_POS  := 8*regs_field.CTRL_BASE_ADDR +  4;
        regs_field.CTRL_EBLK_POS   := 8*regs_field.CTRL_BASE_ADDR +  3;
        regs_field.CTRL_DONE_POS   := 8*regs_field.CTRL_BASE_ADDR +  2;
        regs_field.CTRL_FIRST_POS  := 8*regs_field.CTRL_BASE_ADDR +  1;
        regs_field.CTRL_LAST_POS   := 8*regs_field.CTRL_BASE_ADDR +  0;

        return regs_field;
    end New_Regs_Field_Type;

end Interface;
