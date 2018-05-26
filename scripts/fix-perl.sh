#!/usr/bin/env bash
if [ type cave &> /dev/null ]; then
    sudo cave resolve -1x $(cave print-owners -f '%c/%p:%s ' /usr/${CHOST}/lib/perl5/vendor_perl/"$1"-arch )
    sudo cave resolve -1x $(cave print-owners -f '%c/%p:%s ' /usr/${CHOST}/lib/perl5/vendor_perl/"$1"-pure )
else
    echo "Install Paludis first, yo" >&2
fi
