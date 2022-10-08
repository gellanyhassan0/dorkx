#!/bin/bash

echo 'site:'$1

curl 'https://www.google.com/search?q=site%3A'$1'+filetype%3A'$2'&ei=BnRBY5aBFJOM9u8Pu6eA0AM' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.google.com/' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'TE: Trailers' -s|grep -Eoi 'href="https://.{,100}" data-jsarwt'|grep -iv 'policies.google\|support.google'|sed 's/href="//g; s/" data-jsarwt//g'
