# Building and Installing the Mainline Linux Kernel

Today, I learned how to build and install the mainline Linux kernel using my current system’s configuration.

## Steps

1. Clone the repository and configure the kernel:
```bash
git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
```
```bash
cp /boot/config-$(uname -r) .config
make olddefconfig
   ```
  *Note: To manually customize kernel options, run make menuconfig instead.*

2. Build and install the kernel:
```bash
make -j$(nproc)
sudo make modules_install
sudo make install
```

3.	Set up initramfs and update GRUB:
```bash
sudo update-initramfs -c -k <your-kernel-version> # eg. 6.12.0-rc7+
sudo update-grub

```
4.	Reboot:
```bash
sudo reboot
uname -r
# 6.12.0-rc7+
```



