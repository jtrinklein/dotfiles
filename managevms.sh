export DEV_VMX="$HOME/src/dev_ppm/.vagrant/machines/default/vmware_fusion/538097f6-4aa0-48fa-bea7-fb129cd997a4/packer-vmware-vmx-{{timestamp}}.vmx"
export IE10_VMX="$HOME/IE VMs/IE10 - Win7.vmwarevm/IE10 - Win7.vmx"
export DEV_VM_ID="prl-dev_ppm"

findVm() {
    local vm=${1:-dev_ppm}
    local awk_script="/$vm/ { print \$1 }"
    #VM_ID=`VBoxManage list vms | awk $awk_script`
    VM_ID=`prlctl list | awk $awk_script`

    echo "$VM_ID"
}

vm() { 

    local command=$1
    local vmname=${2:-prl-dev_ppm}

    case "$command" in
        start)
            prlctl start $vmname
            ;;
        stop)
            prlctl stop $vmname
            ;;
        suspend)
            prlctl suspend $vmname
            ;;
        *)
            echo "no."
            ;;
    esac
}

export findVm
export vm
