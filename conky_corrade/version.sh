#!/bin/bash

pathConky="$( cd "$(dirname "$0")" ; pwd -P )"
source $pathConky/corrade_setup

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

rawdatadecode() {
#QUERY_STRING='param1=value1&param2=value2&param3=value3'
QUERY_STRING=$(curl -d "command=version&group=$GroupUUID&password=$GroupPassword" $HttpServer)
arr=(${QUERY_STRING//[=&]/ })
echo "corrade v"$(urldecode ${arr[5]})  #sudo apt install renameutils
}

if [ "$(/sbin/iwgetid -r)" == "$HomeWifiSSID" ]; then 
rawdatadecode
else
echo "$(/sbin/iwgetid -r)"" is not home wifi."
fi