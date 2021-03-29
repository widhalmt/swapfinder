#!/bin/bash

SWAPPROCESSLIST=$(ls /proc)

for i in ${SWAPPROCESSLIST}
do
	if [ -f /proc/$i/status ]
	then
		CURRENTPROCESS=$(grep Name /proc/$i/status | cut -d: -f2)
		SWAPUSAGE=$(grep VmSwap /proc/$i/status | cut -d: -f2 | tr -d [[:space:]] )
		if [ -n "${SWAPUSAGE}" ]
		then
			if [ "${SWAPUSAGE}" != "0kB" ]
			then
				echo "${CURRENTPROCESS} uses ${SWAPUSAGE} swap"
			fi
		fi
	fi
done
