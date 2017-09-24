#!/bin/bash
cd "$(dirname "$0")"
source ../spackle

# import another file by its name
import imported.sh

# try accessing the namespaced members
echo "$imported__publicvar"
imported__publicfunc
echo

echo "===== errors expected ====="

# try accessing the pre-namespaced members (these should produce errors)
echo "${publicvar:-$0: line $LINENO: publicvar is undefined}"
publicfunc
echo

# try accessing private members (these should produce errors)
echo "${__privatevar:-$0: line $LINENO: __privatevar is undefined}"
__privatefunc
echo "${imported__privatevar:-$0: line $LINENO: imported__privatevar is undefined}"
imported__privatefunc
