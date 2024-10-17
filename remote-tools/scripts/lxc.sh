#!/bin/sh

if [ -z "$1" ]
then
	echo -e "No argument supplied\n\tUse: $0 <image_file>\n"
	exit 1
fi

if [ `id | grep -e "(lxd)" -e "(lxc)" -c` -eq 0 ]
then
	printf "You have to be part of the \033[31m\033[1mlxc\033[0m or \033[31m\033[1mlxd\033[0m group! \n"
	exit 1
fi

lxc image import $1 --alias temp
lxc init temp temp_machine -c security.privileged=true
lxc config device add temp_machine host-root disk source=/ path=/mnt/root recursive=true
lxc start temp_machine
lxc exec temp_machine /bin/sh
