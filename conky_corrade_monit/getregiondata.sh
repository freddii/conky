#!/bin/bash

pathConky="$( cd "$(dirname "$0")" ; pwd -P )"
source $pathConky/corrade_setup

rawdatadecode() {
#QUERY_STRING='param1=value1&param2=value2&param3=value3'
QUERY_STRING=$(curl -d "command=getregiondata&group="$GroupUUID"&password="$GroupPassword"&data=Name,SimVersion,Dilation,FPS,PhysicsFPS,Agents,Objects,ScriptedObjects,ActiveScripts,CPURatio,WaterHeight,LastLag,ConnectTime" $HttpServer)
arr=(${QUERY_STRING//[=&]/ })
arrv_v2=$(echo ${arr[5]} | sed -e 's/%20/ /g' | sed -e $'s/%0A/\\\n/g' | sed -e 's/%25/%/g' | sed -e 's/%5B/[/g' | sed -e 's/%5D/]/g' | sed -e 's/%3A/:/g' | sed -e 's|%2F|/|g' | sed -e "s|%27|'|g" | sed -e 's|%2C|,|g' | sed -e 's|%22|"|g' | sed -e $'s/Name,/Name:   /g'  | sed -e $'s/,SimVersion,/\\\nVersion: /g' | sed -e $'s/"Second Life Server /"/g' | sed -e $'s/,FPS,/\\\nFPS :/g' | sed -e $'s/,Dilation,/\\\nDilation: /g' | sed -e $'s/,PhysicsFPS,/ \\\nPhysicsFPS: /g' | sed -e $'s/,Agents,/\\\nAgents: /g' | sed -e $'s/,Objects,/\\\nObjects: /g' | sed -e $'s/,ScriptedObjects,/\\\nScriptedObjects: /g' | sed -e $'s/,ActiveScripts,/\\\nActiveScripts: /g' | sed -e $'s/,CPURatio,/\\\nCPURatio: /g' | sed -e $'s/,WaterHeight,/\\\nWaterHeight: /g' | sed -e $'s/,LastLag,/\\\nLastLag: /g' | sed -e $'s/,ConnectTime,/\\\nConnectTime: /g')
echo "$arrv_v2"
}

rawdatadecode