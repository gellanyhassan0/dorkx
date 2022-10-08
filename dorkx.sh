#!/bin/bash

site=$1
type=$2
echo 'site:'$site


basic() {
   
   if [[ $type = "all" ]] ; then 

      cat dorks/filetype.txt|while read line ; do 
      curl 'https://www.google.com/search?q=site%3A'$site'+filetype%3A'$line'&ei=BnRBY5aBFJOM9u8Pu6eA0AM' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.google.com/' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'TE: Trailers' -s|grep -Eoi 'href="https://.{,100}" data-jsarwt'|grep -iv 'policies.google\|support.google'|sed 's/href="//g; s/" data-jsarwt//g'
      done

   else :
      curl 'https://www.google.com/search?q=site%3A'$site'+filetype%3A'$type'&ei=BnRBY5aBFJOM9u8Pu6eA0AM' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.google.com/' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'TE: Trailers' -s|grep -Eoi 'href="https://.{,100}" data-jsarwt'|grep -iv 'policies.google\|support.google'|sed 's/href="//g; s/" data-jsarwt//g'

  fi

}

basic
