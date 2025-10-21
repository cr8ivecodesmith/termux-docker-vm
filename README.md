# Docker VM Termux

## Steps

**1\. Clone this repo**

```shell
git clone https://github.com/cr8ivecodesmith/termux-docker-vm.git
```

**2\. In Termux, run the setup file**(

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

**3\. Back in Termux, boot the VM again**

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

**4\. Start or Stop the VM**

Start the VM with:

```shell
vm-docker-start
```

or stop with:

```shell
vm-docker-stop
```

**5\. Install the Docker client**

You can run this script under proot:

For example, if you have a proot named "ubuntu" with a user named "matt"

```shell
proot-distro login --user "matt" "ubuntu" --shared-tmp --work-dir "$PWD" --termux-home
```

Then from within the proot shell:

```shell
./proot-docker-client-install.sh
```

Or as single command from Termux:

```shell
proot-distro login --user "matt" "ubuntu" --shared-tmp --work-dir "$PWD" --termux-home -- bash proot-docker-client-install.sh
```

Then from Termux you can run:

```shell
proot-distro login --user "matt" "ubuntu" --shared-tmp --work-dir "$PWD" --termux-home -- docker --help
```

Then you can just add an alias from your Termux shell to shorten the command.

**6\. Update the Docker client context to use the VM**

Add the VM in your ssh config:

```shell
echo "
# Docker VM host
Host vm-docker
  HostName 127.0.0.1
  Port 2222
  User root
" >> ~/.ssh/config
```

Create a new docker context:

```shell
docker context create vm-docker --docker "host=ssh://vm-docker"
```

When the VM is running, you can set the docker client context to use it:

```shell
docker context use vm-docker
```


## References

- https://github.com/cyberkernelofficial/docker-in-termux
- https://docs.docker.com/engine/install/ubuntu/

