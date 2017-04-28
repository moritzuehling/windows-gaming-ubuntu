echo "Installing dependencies"
sudo apt install pciutils coreutils libsystemd-dev qemu udev curl git libarchive-dev libudev-dev  mono-devel samba rpm2cpio

echo "Installing a modern version of Rust"
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

echo "Working around a bug"
mkdir -p ~/.config/windows-gaming-driver/

curl https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.126-2/virtio-win-0.1.126_amd64.vfd > virtio-win_amd64.vfd

git clone https://github.com/main--/windows-gaming.git
