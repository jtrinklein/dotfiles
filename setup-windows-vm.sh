#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


echo "Setting up windows VM"

PATH_TO_VAGRANT_BOX="/Users/$SUDO_USER/src/dev_ppm"
DEV_VMX=`find $PATH_TO_VAGRANT_BOX -name '*.vmx'`

if [[ -z "$DEV_VMX" ]]; then
  echo "Vagrant box not found, setting up vagrant box..."

  #SUDO_USER gives the user that called this so the following can be run NOT as root
  su $SUDO_USER <<EOF
    vagrant box add http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/dev_ppm
    echo "Running against $PATH_TO_VAGRANT_BOX"
    mkdir $PATH_TO_VAGRANT_BOX
    cd $PATH_TO_VAGRANT_BOX
    vagrant init dev_ppm
    vagrant up
    vagrant halt
EOF

fi # vagrant box install/setup


if [[ ! -e "$DEV_VMX.bak" ]]; then
  echo "patching vmx with fixed ip on host only network..."


  echo "backing up vmx to $DEV_VMX.bak"
  cp "$DEV_VMX" "$DEV_VMX.bak"

  gawk -i inplace '{
    if ($1 == "ethernet0.connectiontype") { $3 = "\"nat\""; }
    if ($1 == "ethernet0.displayname") { $3 = "\"NAT\""; }
    if ($1 == "memsize") { $3 = "\"8192\""; }
    if ($1 == "numvcpus") { $3 = "\"4\""; }
    if ($1 == "mks.enable3d") { $3 = "\"TRUE\""; }
    print }' "$DEV_VMX"

  cat <<'END' >> "$DEV_VMX"
  ethernet1.address = "00:50:56:34:3E:88"
  ethernet1.virtualDev = "e1000e"
  ethernet1.present = "TRUE"
  ethernet1.connectionType = "hostonly"
  ethernet1.addressType = "static"
  ethernet1.wakeOnPcktRcv = "FALSE"
END

  cat <<'VMNET1' >> "/Library/Preferences/VMWare Fusion/vmnet1/dhcpd.conf"
  host ppm {
  	hardware ethernet 00:50:56:34:3E:88;
  	fixed-address 192.168.56.101;
  }
VMNET1

fi
