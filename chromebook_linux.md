# Installing GalliumOS in a Acer 514 Chromebook

## Back up you're stuff! 
This process comletely erases you're machine.

## Developer mode
[source](https://wiki.galliumos.org/Installing/Preparing)
1) `esc` + `refresh` + `power` to boot into developer mode. No need to login (enter guest mode)
2) `ctrl` + `alt` + `T` to enter terminal
3) Run `shell`
4) Run `sudo crossystem dev_boot_legacy=1`
5) Run `reboot`

## Flashing
1) `ctrl+D` at the bootloader to ender developer mode 
2) Open terminal & shell 
3) Type `cd; curl -LO https://mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh` and follow instructions
4) Reboot 

## Installing
1) Prepare an installtion USB drive as specified [here](https://wiki.galliumos.org/Installing/Creating_Bootable_USB)
2) At startup press `ctrl+L`, and `esc` to see a list of bootable devices. 
3) Select the USB drive and install from there 

## Post Installation
Turn off all sleep / hibernation functions. If the computer goes to sleep it will revert to developer mode. If that happens press `crtl+D` at boot and follow steps 2-5 of "Developer Mode".

## Wifi setup
1) To install any `dkms` you'll have to first install `libelf-dev` (see [this issue](https://github.com/anbox/anbox/issues/834))
2) Install `git` 
3) Install NIC drivers: `git clone https://github.com/aircrack-ng/rtl8812au.git` and run `./dkms-install.sh`
4) Right-click network icon and disable WiFi
5) Again right-click and "Edit connections"
6) Add a connection: Mode is "Hotspot", and under "IPv4" setting Method = "Shared to other computers" (choose ESSID, device, security settings, channel, etc. accordingly). [source](https://mrsaiwal.github.io/linux/wifi-hotspot/)

