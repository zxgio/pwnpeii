#!/usr/bin/env bash
while :
do
        sleep 10
        find /tmp -user problemuser -exec rm -r {} \;
        find /var/tmp -user problemuser -exec rm -r {} \;
        find /dev/shm -user problemuser -exec rm -r {} \;
done
