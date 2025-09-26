#!/bin/bash

set -e

error(){

   echo 'there is an error'
}
trap 'echo "there is an error in $LINENO, command is : $BASh_COMMAND"'  ERR
echo "HEllo"
ahdkghsdlkfj
echo "above line is an error"