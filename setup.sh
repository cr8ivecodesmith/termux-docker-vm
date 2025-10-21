#!/bin/bash

VM_DIR=$HOME/VirtualMachines
DOCKER_VM=$VM_DIR/Docker
ALPINE_VER=3.22
ALPINE_IMG=alpine-virt-$ALPINE_VER.0-x86_64.iso
ALPINE_IMG_URL=https://dl-cdn.alpinelinux.org/v$ALPINE_VER/releases/x86_64/$ALPINE_IMG
DISK_SIZE=128G
MEM=2048
CPUS=4

mkdir -p $HOME/.local/bin
cp $DOCKER_VM/vm-docker-st* $HOME/.local/bin/

pkg install qemu-utils qemu-common qemu-system-x86_64-headless wget -y

mkdir -p $DOCKER_VM

wget -O $DOCKER_VM/$ALPINE_IMG $ALPINE_IMG_URL

qemu-img create -f qcow2 $DOCKER_VM/disk.img $DISK_SIZE

qemu-system-x86_64 \
  -machine q35 \
  -m $MEM \
  -smp cpus=$CPUS \
  -cpu qemu64 \
  -drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
  -netdev user,id=n1,dns=8.8.8.8,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -cdrom $DOCKER_VM/$ALPINE_IMG \
  -nographic $DOCKER_VM/disk.img

