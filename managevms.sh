export DEV_VMX="$HOME/src/dev_ppm/.vagrant/machines/default/vmware_fusion/76259499-d23d-4a18-b78b-b02db77e121d/packer-vmware-vmx-1411665448.vmx"
export IE9_VMX="$HOME/IE VMs/IE9 - Win7.vmwarevm/IE9 - Win7.vmx"
export IE10_VMX="$HOME/IE VMs/IE10 - Win7.vmwarevm/IE10 - Win7.vmx"

findVms() {
    DEV_VMX=`find ~/src/dev_ppm -name '*.vmx'`
    IE9_VMX=`find ~/IE\ VMs -name 'IE9*.vmx'`
    IE10_VMX=`find ~/IE\ VMs -name 'IE10*.vmx'`
    echo "Dev: $DEV_VMX"
    echo "IE9: $IE9_VMX"
    echo "IE10: $IE10_VMX"
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
        *)
            echo "unknown vm: $vmname"
            echo "using dev vm"
            ;;
    esac
    #echo "vmrun -T fusion $1 $vmx $args"
    vmrun -T fusion $command $vmx $args
}

export findVms
export vm
