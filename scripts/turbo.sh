#!/usr/bin/env bash
set -e

if [[ ! -z $1 && $1 != "enable" && $1 != "disable" && $1 != "get" ]];then
    echo "Invalid argument: $1" >&2
    echo ""
    let "err++"
fi

if [ $err ] || [ "$#" -eq "0" ];then
    echo "Usage: $(basename $0) [disable|enable|get]" >&2
    exit 1
fi

no_turbo="/sys/devices/system/cpu/intel_pstate/no_turbo"

if ! [ -e $no_turbo ];then 
    echo "This CPU does not support Intel P-State, sorz m8" >&2
    exit 1
fi

if [[ $(cat $no_turbo) == '1' ]];then
    enabled=false
else
    enabled=true
fi

if [[ $1 == "disable" ]];then
    if $enabled;then
        echo '1' | sudo dd of=$no_turbo 2> /dev/null
    else 
        echo 'Already disabled' >&2
    fi
elif [[ $1 == "enable" ]];then
    if $enabled;then
        echo 'Already enabled' >&2
    else 
        echo '0' | sudo dd of=$no_turbo 2> /dev/null
    fi
elif [[ $1 == 'get' ]];then
    if $enabled;then
        echo 'Turbo is enabled' >&2
    else
        echo 'Turbo is disabled' >&2
    fi
fi

exit 0
