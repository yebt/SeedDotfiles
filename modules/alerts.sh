#!/bin/bash

################################
## Alert definition
## @yebt
##
################################

. /home/de-web/Develop/repositories/dotfiles/modules/colors.sh

# Abstract alert
s_alert() {
	local _color="$1"
	local _text="$2"
	local _icon="$3 "
	echo -e "${_color}${F_BLD}${_icon}${NC}${_color}${_text}${NC}"
}

s_inf() {
	s_alert $FG_BL "$1" "[i]"
}
s_err() {
	s_alert $FG_RD "$1" "[x]"
}
s_war() {
	s_alert $FG_RNG "$1" "[!]"
}
s_suc() {
	s_alert $FG_GRN "$1" "[>]"
}
