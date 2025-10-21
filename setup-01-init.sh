#!/bin/bash

setup-interfaces

ifup eth0

wget https://raw.githubusercontent.com/cr8ivecodesmith/termux-docker-vm/refs/heads/main/answerfile

sed -i -E 's/(local kernel_opts)=.*/\1="console=ttyS0"/' /sbin/setup-disk

setup-alpine -f answerfile

