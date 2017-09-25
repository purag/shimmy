#!/bin/bash
source ../../spackle
package myProject

import util/helpers.sh

echo "$util__var"
__trimmed=`util__str__trim "  hello  "`
echo "'$__trimmed'" # "hello"
