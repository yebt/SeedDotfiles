#!/bin/bash

################################
## Help Aux Funcitons
## Requiere: Colors
## @yebt
##
################################

# Aux
_s_ptn() {
	echo -e "\t${FG_YLLW}${F_BLD}$1${NC}"
}
_s_ptn_txt() {
	local _text="$1"
	local _offset="  "
	local _wrap=40
	local wrapped_text=$(echo "$_text" | fold -s -w "$_wrap")

	while IFS= read -r line; do
		echo -e "\t\t${F_TLC}$line${NC}"
	done <<<"$wrapped_text"
}
# main
s_fll_ptns() {
	for _ptn in "${@}"; do
		IFS=';' read -ra SLPT_OPTS <<<"$_ptn"
		local _opt="${SLPT_OPTS[0]}"
		local _txt="${SLPT_OPTS[1]}"
		_s_ptn "$_opt"
		_s_ptn_txt "$_txt"
	done
}
