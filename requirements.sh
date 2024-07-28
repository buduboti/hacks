#!/bin/bash

TEXT_DEFAULT="\e[0m"

TEXT_RED="\e[31m"
TEXT_GREEN="\e[32m"
TEXT_YELLOW="\e[33m"
TEXT_BLUE="\e[34m"
TEXT_MAGENTA="\e[35m"
TEXT_CYAN="\e[36m"

# Bold
TEXT_BOLD_BLACK='\033[1;30m'
TEXT_BOLD_RED='\033[1;31m'
TEXT_BOLD_GREEN='\033[1;32m'
TEXT_BOLD_YELLOW='\033[1;33m'
TEXT_BOLD_BLUE='\033[1;34m'
TEXT_BOLD_MAGENTA='\033[1;35m'
TEXT_BOLD_CYAN='\033[1;36m'
TEXT_BOLD_WHITE='\033[1;37m'

declare -a installments=(	"gobuster"
							"nmap"
							)

if [ "$(uname)" == "Darwin" ]
then
	printf "$TEXT_CYAN[macOS]: $TEXT_DEFAULT\n"

	BREW=$(which brew)

	if echo $BREW | grep "not found" 
	then
		printf "$TEXT_RED\tPlease install brew before run this script! ( ${TEXT_BOLD_WHITE}https://brew.sh$TEXT_RED )$TEXT_DEFAULT"
		exit 1
	fi

	for p in "${installments[@]}"
	do
		printf "\t-$TEXT_BOLD_MAGENTA $p$TEXT_DEFAULT\n"
		$BREW install $p
	done
elif [ "$(uname)" == "Linux" ]
then
	if cat /etc/issue | grep "Ubuntu" 
	then
		APT=$(which apt)

		$APT update

		for p in "${installments[@]}"
		do
			printf "\t-$TEXT_BOLD_MAGENTA $p$TEXT_DEFAULT\n"
			$APT install -y $p
		done
	fi
fi
