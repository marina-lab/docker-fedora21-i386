Create a 32-bit Fedora 21 base image for Docker, with systemd, the easy way.

Initial image is imported from the official cloud release in qcow2 format:
```
wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Cloud/Images/i386/Fedora-Cloud-Base-20141203-21.i386.qcow2
virt-tar-out -a Fedora-Cloud-Base-20141203-21.i386.qcow2 / - \
    | docker import - marina/fedora21-i386
```

Hosted on Docker Hub at
[marina/fedora21-i386](https://registry.hub.docker.com/u/marina/fedora21-i386/).

systemd is enabled using the technique from
[maci0/docker-systemd-unpriv](https://github.com/maci0/docker-systemd-unpriv).

To run unprivileged, you need to mount croups read-only:
```
docker run -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro marina/fedora21-i386:0.1.1
```
