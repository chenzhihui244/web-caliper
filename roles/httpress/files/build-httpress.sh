#!/bin/bash

[ -z $1 ] && {
    echo "usage: $0 <httpress path>"
    exit 1
}

[ -x /usr/local/bin/httpress ] && exit 0

httpress_path=$1

cd ${httpress_path}
make && cp bin/Release/httpress /usr/local/bin/
