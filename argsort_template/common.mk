VIVADO        ?= vivado
BOOTGEN       ?= bootgen
COPY          ?= cp
REMOVE        ?= rm -rf
SED           ?= sed
BIN_FILE_PATH ?= ..
BIN_FILE      ?= $(BIN_FILE_PATH)/argsort_$(MRG_WAYS)_$(MRG_WORDS)_$(STM_FEEDBACK).bin
BIT_FILE      ?= project.runs/impl_1/design_1_wrapper.bit
TEMPLATE_PATH ?= $(dir $(lastword $(MAKEFILE_LIST)))
VIVADO_FILES  ?= create_project.tcl implementation.tcl add_fan_enable.tcl design_1_pin.xdc design_1.bif 
DESIGN_FILE   ?= design_1_bd_2021.2.tcl

all    : $(BIN_FILE)

scripts: $(VIVADO_FILES) $(DESIGN_FILE)

project: project.xpr

binary : $(BIN_FILE)

clean  :
	$(REMOVE) $(VIVADO_FILES) $(DESIGN_FILE) project.xpr

define GET_VIVADO_FILES
$(1) : $(addprefix $(TEMPLATE_PATH)/,$(1))
	$(COPY) $(addprefix $(TEMPLATE_PATH)/,$(1)) $(1)
endef

$(DESIGN_FILE) : $(addprefix $(TEMPLATE_PATH)/,$(DESIGN_FILE))
	$(SED) -e 's/\(.*CONFIG.MRG_WAYS\).*/\1 {$(MRG_WAYS)} \\/'         \
               -e 's/\(.*CONFIG.MRG_WORDS\).*/\1 {$(MRG_WORDS)} \\/'       \
               -e 's/\(.*CONFIG.STM_FEEDBACK\).*/\1 {$(STM_FEEDBACK)} \\/' \
               $< > $@

$(foreach FILE, $(VIVADO_FILES), $(eval $(call GET_VIVADO_FILES, $(FILE))))

project.xpr : $(VIVADO_FILES) $(DESIGN_FILE)
	$(VIVADO) -mode batch -source create_project.tcl

$(BIT_FILE) : project.xpr
	$(VIVADO) -mode batch -source implementation.tcl

$(BIN_FILE) : $(BIT_FILE)
	$(BOOTGEN) -arch zynqmp -image design_1.bif -w -o $(BIN_FILE)
