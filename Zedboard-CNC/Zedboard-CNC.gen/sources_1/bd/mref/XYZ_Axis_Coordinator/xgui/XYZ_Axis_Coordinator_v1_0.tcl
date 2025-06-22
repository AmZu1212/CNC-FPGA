# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CYCLES_PER_SECOND" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_SPEED" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MICRONS_PER_STEP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MIN_SPEED" -parent ${Page_0}


}

proc update_PARAM_VALUE.CYCLES_PER_SECOND { PARAM_VALUE.CYCLES_PER_SECOND } {
	# Procedure called to update CYCLES_PER_SECOND when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CYCLES_PER_SECOND { PARAM_VALUE.CYCLES_PER_SECOND } {
	# Procedure called to validate CYCLES_PER_SECOND
	return true
}

proc update_PARAM_VALUE.MAX_SPEED { PARAM_VALUE.MAX_SPEED } {
	# Procedure called to update MAX_SPEED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_SPEED { PARAM_VALUE.MAX_SPEED } {
	# Procedure called to validate MAX_SPEED
	return true
}

proc update_PARAM_VALUE.MICRONS_PER_STEP { PARAM_VALUE.MICRONS_PER_STEP } {
	# Procedure called to update MICRONS_PER_STEP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MICRONS_PER_STEP { PARAM_VALUE.MICRONS_PER_STEP } {
	# Procedure called to validate MICRONS_PER_STEP
	return true
}

proc update_PARAM_VALUE.MIN_SPEED { PARAM_VALUE.MIN_SPEED } {
	# Procedure called to update MIN_SPEED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MIN_SPEED { PARAM_VALUE.MIN_SPEED } {
	# Procedure called to validate MIN_SPEED
	return true
}


proc update_MODELPARAM_VALUE.MIN_SPEED { MODELPARAM_VALUE.MIN_SPEED PARAM_VALUE.MIN_SPEED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MIN_SPEED}] ${MODELPARAM_VALUE.MIN_SPEED}
}

proc update_MODELPARAM_VALUE.MAX_SPEED { MODELPARAM_VALUE.MAX_SPEED PARAM_VALUE.MAX_SPEED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_SPEED}] ${MODELPARAM_VALUE.MAX_SPEED}
}

proc update_MODELPARAM_VALUE.CYCLES_PER_SECOND { MODELPARAM_VALUE.CYCLES_PER_SECOND PARAM_VALUE.CYCLES_PER_SECOND } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CYCLES_PER_SECOND}] ${MODELPARAM_VALUE.CYCLES_PER_SECOND}
}

proc update_MODELPARAM_VALUE.MICRONS_PER_STEP { MODELPARAM_VALUE.MICRONS_PER_STEP PARAM_VALUE.MICRONS_PER_STEP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MICRONS_PER_STEP}] ${MODELPARAM_VALUE.MICRONS_PER_STEP}
}

