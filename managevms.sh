export DEV_VMX="$HOME/src/dev_ppm/.vagrant/machines/default/vmware_fusion/538097f6-4aa0-48fa-bea7-fb129cd997a4/packer-vmware-vmx-{{timestamp}}.vmx"
export IE10_VMX="$HOME/IE VMs/IE10 - Win7.vmwarevm/IE10 - Win7.vmx"
export DEV_VM_ID="dev_ppm"

findVm() {
    local vm=${1:-dev_ppm}
    local awk_script="/$vm/ { print \$2 }"
    VM_ID=`VBoxManage list vms | awk $awk_script`

    echo "$VM_ID"
}

vm() { 

    local command=$1
    local vmname=$2
    local vmid=`findVm $vmname`

    case "$command" in
        start)
            VBoxManage startvm $vmid --type headless
            ;;
        startui)
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

export findVm
export vm
