export DEV_VMX="$HOME/src/dev_ppm/.vagrant/machines/default/vmware_fusion/538097f6-4aa0-48fa-bea7-fb129cd997a4/packer-vmware-vmx-{{timestamp}}.vmx"
export IE10_VMX="$HOME/IE VMs/IE10 - Win7.vmwarevm/IE10 - Win7.vmx"
export DEV_VM_ID="{453cad7e-9deb-49d8-9ad9-b067389ff487}"

findVms() {
    DEV_VM_ID=`VBoxManage list vms | awk '/dev[box|_ppm]/ { print $2 }'`
    DEV_VMX=`find ~/src/dev_ppm -name '*.vmx'`
    IE9_VMX=`find ~/IE\ VMs -name 'IE9*.vmx'`
    IE10_VMX=`find ~/IE\ VMs -name 'IE10*.vmx'`
    echo "Dev: $DEV_VMX"
    echo "IE10: $IE10_VMX"
    echo "DevID: $DEV_VM_ID"
}

vm() { 

    local args="nogui"
    local command=$1
    local vmname=$2
    local vmx=$DEV_VMX
    local vmid=$DEV_VM_ID

    if [[ -z "$vmname" ]]; then
        vmname=dev
    fi
    
    case "$vmname" in
        dev)
            vmx=$DEV_VMX
            vmid=$DEV_VM_ID
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
    #/Applications/VMware\ Fusion.app/Contents/Library/vmrun -T fusion $command $vmx $args

    case "$command" in
        startnohead)
            VBoxManage startvm $vmid --type headless
            ;;
        start)
            VBoxManage startvm $vmid
            ;;
        stop)
            VBoxManage controlvm $vmid poweroff
            ;;
        suspend)
            VBoxManage controlvm $vmid savestate
            ;;
        *)
            ;;
    esac
}

export findVms
export vm
