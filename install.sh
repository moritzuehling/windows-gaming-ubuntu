#!/bin/bash

cd windows-gaming

pkgdir=

install -D windows-gaming-driver/target/release/windows-gaming-driver $pkgdir/usr/bin/windows-gaming-driver
install -D -m644 ovmf-x64/OVMF_CODE-pure-efi.fd $pkgdir/usr/lib/windows-gaming/ovmf-code.fd
install -D -m644 ovmf-x64/OVMF_VARS-pure-efi.fd $pkgdir/usr/lib/windows-gaming/ovmf-vars.fd
install -D -m644 guest-agent/windows-gaming-ga.iso $pkgdir/usr/lib/windows-gaming/windows-gaming-ga.iso
install -D -m644 ../virtio-win_amd64.vfd $pkgdir/usr/lib/windows-gaming/virtio-win.vfd
install -D -m644 misc/windows.service $pkgdir/lib/systemd/system/windows.service
install -D -m644 misc/windows.service $pkgdir/lib/systemd/user/windows.service
install -D -m644 misc/80-vfio.rules $pkgdir/lib/udev/rules.d/80-vfio.rules

groupadd --system vfio
usermod -aG vfio $USER

