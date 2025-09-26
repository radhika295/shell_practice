#!/bin/bash

set -e

error(){

   echo 'there is an error'
}
trap error ERR
echo "HEllo"
ahdkghsdlkfj
echo "above line is an error"