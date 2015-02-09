FROM marina/fedora21-i386:0.1.0

ENV container docker
RUN sed -i 's/$basearch/i386/g' /etc/yum.repos.d/*.repo
RUN yum -y install systemd && yum clean all

RUN systemctl mask dev-mqueue.mount dev-hugepages.mount \
    systemd-remount-fs.service sys-kernel-config.mount \
    sys-kernel-debug.mount sys-fs-fuse-connections.mount \
    display-manager.service systemd-logind.service \
    crond.service auditd.service \
    cloud-init.service cloud-init-local.service cloud-config.service \
    cloud-final.service sshd.service network.service getty.target

ADD dbus.service /etc/systemd/system/dbus.service

VOLUME ["/sys/fs/cgroup"]
VOLUME ["/run"]

CMD ["/sbin/init"]
