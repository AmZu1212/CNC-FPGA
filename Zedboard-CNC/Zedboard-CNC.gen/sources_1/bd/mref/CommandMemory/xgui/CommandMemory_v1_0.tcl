# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "MEM_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POS_X_HEX_FILE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POS_Y_HEX_FILE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POS_Z_HEX_FILE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SPEED_HEX_FILE" -parent ${Page_0}


}

proc update_PARAM_VALUE.MEM_DEPTH { PARAM_VALUE.MEM_DEPTH } {
	# Procedure called to update MEM_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_DEPTH { PARAM_VALUE.MEM_DEPTH } {
	# Procedure called to validate MEM_DEPTH
	return true
}

proc update_PARAM_VALUE.POS_X_HEX_FILE { PARAM_VALUE.POS_X_HEX_FILE } {
	# Procedure called to update POS_X_HEX_FILE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POS_X_HEX_FILE { PARAM_VALUE.POS_X_HEX_FILE } {
	# Procedure called to validate POS_X_HEX_FILE
	return true
}

proc update_PARAM_VALUE.POS_Y_HEX_FILE { PARAM_VALUE.POS_Y_HEX_FILE } {
	# Procedure called to update POS_Y_HEX_FILE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POS_Y_HEX_FILE { PARAM_VALUE.POS_Y_HEX_FILE } {
	# Procedure called to validate POS_Y_HEX_FILE
	return true
}

proc update_PARAM_VALUE.POS_Z_HEX_FILE { PARAM_VALUE.POS_Z_HEX_FILE } {
	# Procedure called to update POS_Z_HEX_FILE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POS_Z_HEX_FILE { PARAM_VALUE.POS_Z_HEX_FILE } {
	# Procedure called to validate POS_Z_HEX_FILE
	return true
}

proc update_PARAM_VALUE.SPEED_HEX_FILE { PARAM_VALUE.SPEED_HEX_FILE } {
	# Procedure called to update SPEED_HEX_FILE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPEED_HEX_FILE { PARAM_VALUE.SPEED_HEX_FILE } {
	# Procedure called to validate SPEED_HEX_FILE
	return true
}


proc update_MODELPARAM_VALUE.MEM_DEPTH { MODELPARAM_VALUE.MEM_DEPTH PARAM_VALUE.MEM_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_DEPTH}] ${MODELPARAM_VALUE.MEM_DEPTH}
}

proc update_MODELPARAM_VALUE.SPEED_HEX_FILE { MODELPARAM_VALUE.SPEED_HEX_FILE PARAM_VALUE.SPEED_HEX_FILE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPEED_HEX_FILE}] ${MODELPARAM_VALUE.SPEED_HEX_FILE}
}

proc update_MODELPARAM_VALUE.POS_X_HEX_FILE { MODELPARAM_VALUE.POS_X_HEX_FILE PARAM_VALUE.POS_X_HEX_FILE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POS_X_HEX_FILE}] ${MODELPARAM_VALUE.POS_X_HEX_FILE}
}

proc update_MODELPARAM_VALUE.POS_Y_HEX_FILE { MODELPARAM_VALUE.POS_Y_HEX_FILE PARAM_VALUE.POS_Y_HEX_FILE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POS_Y_HEX_FILE}] ${MODELPARAM_VALUE.POS_Y_HEX_FILE}
}

proc update_MODELPARAM_VALUE.POS_Z_HEX_FILE { MODELPARAM_VALUE.POS_Z_HEX_FILE PARAM_VALUE.POS_Z_HEX_FILE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POS_Z_HEX_FILE}] ${MODELPARAM_VALUE.POS_Z_HEX_FILE}
}

