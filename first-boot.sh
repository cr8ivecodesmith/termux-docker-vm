#!/bin/bash

VM_DIR=$HOME/VirtualMachines
DOCKER_VM=$VM_DIR/Docker
MEM=2048
CPUS=4

qemu-system-x86_64 \
  -machine q35 \
  -m $MEM \
  -smp cpus=$CPUS \
  -cpu qemu64 \
  -drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
  -netdev user,id=n1,dns=8.8.8.8,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -nographic $DOCKER_VM/disk.img
