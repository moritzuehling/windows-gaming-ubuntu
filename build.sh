#!/bin/bash

echo "Building..."

cd windows-gaming

cd windows-gaming-driver
cargo build --release
cd ..

cd guest-agent
xbuild /p:Configuration=Release VfioService/VfioService.sln
cp VfioService/VfioService/bin/Release/VfioService.exe .
mkisofs -m VfioService -o windows-gaming-ga.iso -r -J -input-charset iso8859-1 -V "windows-gaming-ga" .
cd ..

# grab ovmf
curl -o ovmf.rpm "https://www.kraxel.org/repos/jenkins/edk2/$(curl -s 'https://www.kraxel.org/repos/jenkins/edk2/' | grep -Eo 'edk2.git-ovmf-x64-[-\.a-z0-9]+\.noarch\.rpm' | head -n1)"
rpm2cpio ovmf.rpm | bsdtar -xvf - --strip-components 4 './usr/share/edk2.git/ovmf-x64/OVMF_CODE-pure-efi.fd' './usr/share/edk2.git/ovmf-x64/OVMF_VARS-pure-efi.fd'

