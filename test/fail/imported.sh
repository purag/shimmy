#!/bin/bash
source ../../spackle
package imported

__private="hello"

func () {
  echo "$__private"
}

func2 () {
  func
}
