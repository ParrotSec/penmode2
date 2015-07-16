#!/bin/bash
########################################################################
# by PINPEREPETTE (the Pirate) #
########################################################################
# This program is free software; you can redistribute it and/or modify #
# it under the terms of the GNU General Public License as published by #
# the Free Software Foundation; either version 2 of the License, or #
# (at your option) any later version. #
# #
# This program is distributed in the hope that it will be useful, #
# but WITHOUT ANY WARRANTY; without even the implied warranty of #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the #
# GNU General Public License for more details. #
# #
# You should have received a copy of the GNU General Public License #
# along with this program; if not, write to the Free Software #
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, #
# MA 02110-1301, USA. #
############################# DISCALIMER ###############################
# Usage of this software for probing/attacking targets without prior #
# mutual consent, is illegal. It's the end user's responsability to #
# obey alla applicable local laws. Developers assume no liability and #
# are not responible for any missue or damage caused by thi program #
########################################################################
txr=$(tput setaf 1)
txy=$(tput setaf 3)
def=$(tput sgr0)
grs=$(tput bold)
txb=$(tput setaf 4)
crack_web(){
    echo -n "Put the MD5 string to crack: "
    read MD5
    curl http://www.md5-hash.com/md5-hashing-decrypt/$MD5 > temp.html
    sed -e 's/<[^>]*>//g' temp.html > temp.txt
    #X=$(sed -n 176,177p temp.txt)
    X=$(cat temp.txt|grep -A1 md5 )
    rm temp.html
    rm temp.txt
    if [ -n "$X" ]
    then
echo "$X"
    else
echo "password non trovata"
    fi
}
crack_forza_bruta(){
    echo -n "${txy}${grs}Put the MD5 string to bruteforce: ${def}"
    read MD5BF
    echo "#########################################"
    echo ""
    echo "${txb}${grs}Let's guess the password ${def}"
    echo ""
    echo "${txb}${grs}using some social engineering :) ${def}"
    echo ""
    echo "#########################################"
    echo ""
    sleep 2
}
crack_forza_bruta_2(){
        clear
        intro
        echo "${txb}${grs}Edit a list ${def}"
        echo "${txr}${grs}Type ENTER (alone) to exit ${def}"
        echo "${txy}${grs}Insert a word ${def}"
        read P
        PQ=$(echo -n "$P" | md5sum)
        echo $PQ > temp.txt
        echo $P >> temp.txt
        if [ $P >/dev/null ]; then
crack_forza_bruta_3
    else
crack_forza_bruta_4
    fi
}        
crack_forza_bruta_3(){
        clear
        intro
        echo "${txy}${grs}Insert a word ${def}"
        read P
        PQ=$(echo -n "$P" | md5sum)
        echo $PQ >> temp.txt
        echo $P >> temp.txt
        if [ $P >/dev/null ]; then
crack_forza_bruta_3
    else
crack_forza_bruta_4
    fi
}
crack_forza_bruta_4(){
        clear
        intro
        J=$(cat temp.txt|grep -A1 "$MD5BF" )
    rm temp.txt
    if [ -n "$J" ]
    then
echo "$J"
    else
echo "Password doesn't match"
    fi
}                
create(){
        echo -n "Type the text to code in MD5: "
    read Y
    Z=$(echo -n "$Y" | md5sum)
    clear
    intro
    echo ""
    echo "#########################################"
    echo $Z
    echo ""
    echo "#########################################"
}
intro(){
clear
echo "#########################################"
echo "${txr}
                  (             
          (       )\ )  (  (    
          )\))(  (()/(  )\))(   
         ((_)()\  /(_))((_)()\ 
         (_()((_)(_))_  (()((_)    
         |  \/  | |   \  | __|  
         | |\/| | | |) | |__ \  
         |_|  |_| |___/  |___/  ${def}"
echo " "           
echo "#########################################"                                         
}
menu(){
echo "${txy}${grs} Opzioni: ${def}"        
echo "${txr}-----------------------------------------${def}"
echo "${txb}${grs} 1) Code a string in MD5 ${def}"
echo "${txb}${grs} 2) Crack a MD5 string ${def}"
echo "${txr}-----------------------------------------${def}"
echo -n "${txy}${grs}What to do ? ${def}"
        read CS
case "$CS" in
        1)
        intro
        create
        menu
        ;;
        2)
        intro
        crack_forza_bruta
        crack_forza_bruta_2
    menu
        ;;        *)
        clear
        intro
        echo "${txy}${grs} CoccoDio !! ${def}"
        echo ""
        echo "${txy}${grs} You have 3 options ${def}"
        echo ""
    echo "#########################################"
        menu
        ;;
esac        
}
intro
menu
