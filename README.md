# Lustre Client packaging tools for Fedora Copr build
This repository maintains RPM packaging tool that supports building lustre 2.12 client on the Fedora Copr.

- https://copr.fedorainfracloud.org/coprs/orrisroot/lustre-client-el7_9/
- https://copr.fedorainfracloud.org/coprs/orrisroot/lustre-client-el8_5/

## Installation Instructions of Fedora Copr build packages
Currently, Copr repository is provided for EL7.9 and EL8.5 x86\_64 packages.

### RHEL 7.9 based distro
```
$ sudo yum install yum-plugin-copr
$ sudo yum copr enable orrisroot/lustre-client-el7_9
$ sudo yum install lustre-client kmod-lustre-client
```

### RHEL 8.5 based distro
```
$ sudo dnf copr enable orrisroot/lustre-client-el8_5
$ sudo dnf install lustre-client kmod-lustre-client
```
