# Docker VM Termux

## Steps

1\. In Termux, run the setup file

```shell
bash setup.sh
```

2\. In the VM, perform initial setup

```shell
wget https://raw.githubusercontent.com/cr8ivecodesmith/termux-docker-vm/refs/heads/main/setup-01-init.sh
```

```shell
chmod +x setup-01-init.sh
```

```shell
./setup-01-init.sh
```

When done, shutdown the VM

```shell
poweroff
```

3\. Back in Termux, boot the VM again

```shell
bash first-boot.sh
```

5\. In the VM, install docker

```shell
wget https://raw.githubusercontent.com/cr8ivecodesmith/termux-docker-vm/refs/heads/main/setup-02-docker.sh
```

```shell
chmod +x setup-02-docker.sh
```

```shell
./setup-02-docker.sh
```

When done, shutdown the VM

```shell
poweroff
```

6\. Start or Stop the VM

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
