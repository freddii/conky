#!/bin/bash

pathConky="$( cd "$(dirname "$0")" ; pwd -P )"
source $pathConky/corrade_setup

rawdatadecode() {
#QUERY_STRING='param1=value1&param2=value2&param3=value3'
QUERY_STRING=$(curl -d "command=execute&group=$GroupUUID&password=$GroupPassword&file=/usr/bin/sudo&parameter= /usr/bin/monit status" $HttpServer) # corrade$BotFolderName
arr=(${QUERY_STRING//[=&]/ })
echo ${arr[5]} | sed -e 's/%20/ /g' | sed -e $'s/%0A/\\\n/g' | sed -e 's/%25/%/g' | sed -e 's/%5B/[/g' | sed -e 's/%5D/]/g' | sed -e 's/%3A/:/g' | sed -e 's|%2F|/|g' | sed -e "s|%27|'|g" | sed -e 's|%2C|,|g' | sed -e 's/data collected               .*, /data collected               /g'
}

if [ "$(/usr/sbin/iwgetid -r)" == "$HomeWifiSSID" ]; then 
rawdatadecode
else
echo "$(/usr/sbin/iwgetid -r)"" is not home wifi."
fi