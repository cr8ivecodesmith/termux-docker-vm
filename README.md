# Docker VM Termux

## Steps

\1. In Termux, run the setup file

```shell
bash setup.sh
```

\2. Then run first boot script to enter the VM for the first time

```shell
bash first-boot.sh
```

\3. In the VM, perform initial setup

```shell
wget https://raw.githubusercontent.com/cr8ivecodesmith/termux-docker-vm/main/setup-01-init.sh
chmod +x setup-01-init.sh
./setup-01-init.sh
```

When done, shutdown the VM

```shell
poweroff
```

\4. Back in Termux, boot the VM again

```shell
bash first-boot.sh
```

\5. In the VM, install docker

```shell
wget https://raw.githubusercontent.com/cr8ivecodesmith/termux-docker-vm/main/setup-02-docker.sh
chmod +x setup-02-docker.sh
./setup-02-docker.sh
```

When done, shutdown the VM

```shell
poweroff
```

\6. Start or Stop the VM

Start the VM with:

```shell
vm-docker-start
```

or stop with:

```shell
vm-docker-stop
```

## References

- https://github.com/cyberkernelofficial/docker-in-termux
