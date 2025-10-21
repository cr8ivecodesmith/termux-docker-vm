# Docker VM Termux

## Steps

1\. In Termux, run the setup file

```shell
bash setup.sh
```

Once booted into the VM shell, login as `root` with no password.

In the terminal, setup networking:

```shell
setup-interfaces
```

```shell
ifup eth0
```

Then perform initial setup:

```shell
wget https://raw.githubusercontent.com/cr8ivecodesmith/termux-docker-vm/refs/heads/main/answerfile
```

```shell
setup-alpine -f answerfile
```

When done, shutdown the VM

```shell
poweroff
```

3\. Back in Termux, boot the VM again

```shell
bash first-boot.sh
```

In the VM, install docker

```shell
wget https://raw.githubusercontent.com/cr8ivecodesmith/termux-docker-vm/refs/heads/main/setup-docker.sh
```

```shell
chmod +x setup-docker.sh
```

```shell
./setup-docker.sh
```

Then add your Termux ssh public key in the authorized keys:

In Termux:

```shell
cat ~/.ssh/<key>.pub
```

In VM:

```shell
echo "<public key>" >> ~/.ssh/authorized_keys
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

7\. Install the Docker client


## References

- https://github.com/cyberkernelofficial/docker-in-termux
