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
DESIGN_FILES  ?= design_1_bd_2021.2.tcl design_1_bd_2023.1.tcl

IMPL_STRATEGY ?= "Vivado Implementation Defaults"

all    : $(BIN_FILE)

scripts: check-required-vars $(DESIGN_FILES) $(VIVADO_FILES)

project: project.xpr

binary : $(BIN_FILE)

clean  :
	$(REMOVE) $(VIVADO_FILES) $(DESIGN_FILES) project.xpr

REQUIRED_VARS := MRG_WAYS MRG_WORDS STM_FEEDBACK CLK_FREQ
check-required-vars:
	@$(foreach var,$(REQUIRED_VARS), \
		$(if $(value $(var)),,    \
			$(error Required variable "$(var)" is not defined)))

define GET_DESIGN_FILE
$(1) : $(addprefix $(TEMPLATE_PATH)/,$(1))
	$(SED) -e 's/\(.*CONFIG.MRG_WAYS\).*/\1 {$(MRG_WAYS)} \\/'                   \
               -e 's/\(.*CONFIG.MRG_WORDS\).*/\1 {$(MRG_WORDS)} \\/'                 \
               -e 's/\(.*CONFIG.STM_FEEDBACK\).*/\1 {$(STM_FEEDBACK)} \\/'           \
               -e 's/\(.*CONFIG.CLKOUT1_REQUESTED_OUT_FREQ\).*/\1 {$(CLK_FREQ)} \\/' \
               $(addprefix $(TEMPLATE_PATH)/,$(1)) > $(1)
endef

$(foreach FILE, $(DESIGN_FILES), $(eval $(call GET_DESIGN_FILE,$(FILE))))

define GET_VIVADO_FILE
$(1) : $(addprefix $(TEMPLATE_PATH)/,$(1))
	$(COPY) $(addprefix $(TEMPLATE_PATH)/,$(1)) $(1)
endef

create_project.tcl: $(addprefix $(TEMPLATE_PATH)/,create_project.tcl)
	$(SED) -e 's/\(.*set impl_1_strategy\).*/\1  $(IMPL_STRATEGY)/'        \
               $(addprefix $(TEMPLATE_PATH)/,create_project.tcl) > create_project.tcl

$(foreach FILE, $(filter-out create_project.tcl,$(VIVADO_FILES)), $(eval $(call GET_VIVADO_FILE,$(FILE))))

project.xpr : $(VIVADO_FILES) $(DESIGN_FILES)
	$(VIVADO) -mode batch -source create_project.tcl

$(BIT_FILE) : project.xpr
	$(VIVADO) -mode batch -source implementation.tcl

$(BIN_FILE) : $(BIT_FILE)
	$(BOOTGEN) -arch zynqmp -image design_1.bif -w -o $(BIN_FILE)
