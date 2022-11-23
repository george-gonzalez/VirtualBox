#!/bin/bash

#Script assign a MAC address to an OVA based on X variable
#Developed by George G.

localHost="`hostname`"
names="$(</file01/sys/systems/systems_windows/vbox/MACS.txt)" # MAKE SURE TO CHANGE THIS PATH IN PRODUCTION

#MACS.TXT file must be comma separated
#hostname,000000000000 no "":""

#Debug To output Variable contents 
#echo $localHost
#echo $names

#The names are comma separated - look for the current host name on the list stripping the commas
#The else command below can be removed in Production.

for i in $(echo $names | sed "s/,/ /g"); do
            if [[ "$localHost" == "$i" ]]; then
    thisMachine="$i"
    echo Computer found on the list
else
    echo That machine is not on the list
fi

done

assignMAC="`grep $thisMachine </file01/sys/systems/systems_windows/vbox/MACS.txt | awk -F',' '{print $2}'`"

echo "$assignMAC"

# Insert the command to assign the MAC address based on the host name.

VBoxManage modifyvm win10ZbrushAuto --macaddress1 $assignMAC

VBoxManage startvm win10ZbrushAuto --type headless