#!/bin/bash

pathConky="$( cd "$(dirname "$0")" ; pwd -P )"
source $pathConky/corrade_setup

rawdatadecode() {
#QUERY_STRING='param1=value1&param2=value2&param3=value3'
QUERY_STRING=$(curl -d "command=version&group=$GroupUUID&password=$GroupPassword" $HttpServer)
arr=(${QUERY_STRING//[=&]/ })
echo "corrade v"${arr[5]}
}

rawdatadecode