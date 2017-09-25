#!/bin/bash
source ../../../../spackle
package str

# trim leading and trailing whitespace from a string
trim () {
  echo "$1" | sed 's/^ *//g' | sed 's/ *$//g'
}
