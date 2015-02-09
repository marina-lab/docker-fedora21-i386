Create a 32-bit Fedora 21 base image for Docker, the easy way.

```
wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Cloud/Images/i386/Fedora-Cloud-Base-20141203-21.i386.qcow2
virt-tar-out -a Fedora-Cloud-Base-20141203-21.i386.qcow2 / - \
    | docker import - marina/fedora21-i386
```

Hosted on Docker Hub at
[marina/fedora21-i386](https://registry.hub.docker.com/u/marina/fedora21-i386/).
