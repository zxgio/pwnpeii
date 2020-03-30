#!/usr/bin/env bash

cd /home/problemuser && sudo -H -u problemuser firejail \
     --noprofile \
     --caps.drop=all \
     --net=none \
     --noroot \
     --allusers \
     timeout -k 2 60 /home/problemuser/binary
