#!/bin/sh
maschera=$(cat '/opt/penmode/modules/settings/dimensione.txt')
case $maschera in 
	1) /opt/penmode/modules/penmode2mini ;;
	2) /opt/penmode/modules/penmode2 ;;
esac	
