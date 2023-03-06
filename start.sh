#!/bin/sh

modearg=$(cat /proc/cmdline)

echo "Kernel arg: $modearg"
sh -c 'virsh net-start default' || :

#iterate kernel args
for arg in $modearg; do
    case $arg in
        --mode-normal)
            virsh create /home/ndiogen/vm_data/seat_a/settings.xml
            virsh create /home/ndiogen/vm_data/seat_b/settings.xml
            ;;
        --mode-swapped)
            virsh create /home/ndiogen/vm_data/seat_a/settings_swaped.xml
            virsh create /home/ndiogen/vm_data/seat_b/settings_swaped.xml
            ;;
        *)
            ;;
    esac
done
