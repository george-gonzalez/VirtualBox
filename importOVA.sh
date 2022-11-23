#/bin/bash

#Script to import an OVA file on Linux, change the MAC Address and Start
#Developed by George G.

VBoxManage import /file01/sys/systems/systems_windows/vbox/win10ZbrushAuto.ova --vsys 0 --basefolder /var/tmp/VirtualBox 

VBoxManage modifyvm win10ZbrushAuto --macaddress1 08:01:34:15:2C:BA

VBoxManage startvm win10ZbrushAuto --type headlessfile01