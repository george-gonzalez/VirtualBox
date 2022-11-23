#!/bin/bash

#Script to Build a VirtualBox machine on Linux.
#Developed by George G.

VM="win7ZbrushAuto"
VBoxManage createvm --name $VM --ostype "Windows7_64" --register
VBoxManage storagectl $VM --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach $VM --storagectl "SATA Controller" --port 0 --device 0 \
--type hdd --medium /VirtualBox/$VM/$VM.vdi
VBoxManage storagectl $VM --name "IDE Controller" --add ide
VBoxManage storageattach $VM --storagectl "IDE Controller" --port 0 --device 0 \
--type dvddrive --medium /file01/sys/systems/systems_windows/vbox/SW_DVD5_Win_Pro_7w_SP1_64BIT_English_-2_MLF_X17-59279.ISO

VBoxManage modifyvm $VM --ioapic on
VBoxManage modifyvm $VM --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm $VM --memory 8192 --vram 128

VBoxManage unattended install $VM \
--iso=/file01/sys/systems/systems_windows/vbox/SW_DVD5_Win_Pro_7w_SP1_64BIT_English_-2_MLF_X17-59279.ISO \
--user=systems --full-user-name="Systems Department" --password password \
--install-additions --time-zone=EST

VBoxManage startvm $VM --type headless