export DEV_VMX="$HOME/src/dev_ppm/.vagrant/machines/default/vmware_fusion/ec9cfcf3-c9a0-4b08-b508-34259c3747f2/packer-vmware-vmx-1425580834.vmx"
export IE9_VMX="$HOME/IE VMs/IE9.Win7.For.Windows.VMware/IE9 - Win7.vmwarevm/IE9 - Win7.vmx"
export IE10_VMX="$HOME/IE VMs/IE10 - Win7.vmwarevm/IE10 - Win7.vmx"
export EDGE_VMX="$HOME/IE VMs/Microsoft Edge.Win10.For.Mac.VMware/MSEdge - Win10.vmwarevm/MSEdge - Win10.vmx"

findVms() {
    DEV_VMX=`find ~/src/dev_ppm -name '*.vmx'`
    IE9_VMX=`find ~/IE\ VMs -name 'IE9*.vmx'`
    IE10_VMX=`find ~/IE\ VMs -name 'IE10*.vmx'`
    EDGE_VMX=`find ~/IE\ VMs -name 'MSEdge*.vmx'`
    echo "Dev: $DEV_VMX"
    echo "IE9: $IE9_VMX"
    echo "IE10: $IE10_VMX"
    echo "Edge: $EDGE_VMX"
}

vm() { 

    local args="nogui"
    local command=$1
    local vmname=$2
    local vmx=$DEV_VMX

    if [[ -z "$vmname" ]]; then
        vmname=dev
    fi
    
    case "$vmname" in
        dev)
            vmx=$DEV_VMX
            ;;
        ie10)
            vmx=$IE10_VMX
            ;;
        ie9)
            vmx=$IE9_VMX
            ;;
        edge)
            vmx=$EDGE_VMX
            ;;
        *)
            echo "unknown vm: $vmname"
            echo "known vms: *dev, ie9, ie10, edge"
            return
            ;;
    esac
    #echo "vmrun -T fusion $1 $vmx $args"
    vmrun -T fusion $command $vmx $args
}

export findVms
export vm
