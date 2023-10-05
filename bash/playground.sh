#!/bin/bash

if [ $# -gt 0 ]; then
    echo 'Number of arguments:' $#
    echo $@
else
    echo 'No arguments'
fi