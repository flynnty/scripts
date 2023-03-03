#!/bin/bash

source torsocks off
#torsocks wget -qO - https://api.ipify.org; echo
#wget -qO - https://api.ipify.org; echo
echo -e 'AUTHENTICATE "my-tor-password"\r\nSIGNAL NEWNYM\r\nSIGNAL CLEARDNSCACHE\r\nQUIT' | nc 127.0.0.1 9051
#torsocks wget -qO - https://api.ipify.org; echo
#wget -qO - https://api.ipify.org; echo
source torsocks on
