#!/bin/bash
source ../spackle

# declare the package (this will be the prefix/namespace to access members of
# this package when it gets imported)
package imported

publicvar="this will be accessible via imported__publicvar"
publicfunc () {
  echo "this will be accessible via imported__publicfunc"
}

__privatevar="this WILL NOT be accessible since it starts with __"
__privatefunc () {
  echo "this WILL NOT be accessible since it starts with __"
}
