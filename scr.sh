#!/bin/bash

for i in {1..1000} 
do
    content=$(curl -u o_pan:xxxx -s -b 1 -c 1 "http://xxxx:8081/rest/issue/ADM-$i" |    xpath '/issue/field[@name="State"]/value/text()' 2>/dev/null)
    name=$(curl -u o_pan:xxxx -s -b 1 -c 1 "http://xxxx.local:8081/rest/issue/ADM-$i" |    xpath '/issue/field[@name="updaterName"]/value/text()' 2>/dev/null)
    if [ -n "$content" ]
    then
     echo -en "RTGT-$i\t$content\t$name\n" >> list
    fi
done
