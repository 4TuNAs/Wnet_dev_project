#!/bin/bash

#help_key

if [[ "$1" = "-h"  ||  "$1" = "--help"  ]] ; then 
      echo " err_rm.sh hostname username port "
      echo " On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25"
      echo " On D-Link: err_rm.sh 192.168.1.1 admin 25"
      echo " --version,  -v  :  check software version"
      echo " --diagnostic, -d : nods diagnostic"
      echo "--vlan, -v : show vlan info"
      echo "For diagnostic"
      echo "err_rm.sh hostname username port -d"
      echo " On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25 -d"
      echo " On D-Link: err_rm.sh 192.168.1.1 admin 25 -d"
      echo "Show all Vlan"
      echo "err_rm.sh hostname username port -d -vl"
      echo " On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25 -d -vl"
      echo " On D-Link: err_rm.sh 192.168.1.1 admin 25 -d -vl"
      echo "Show target Vlan"
      echo "err_rm.sh hostname username port -d -vl number_vlan"
      echo " On Junipper: err_rm.sh 192.168.1.1 admin xe-1/0/25 -d -vl 1001"
      echo " On D-Link: err_rm.sh 192.168.1.1 admin 25 -d -vl 1001"


      exit 1
else
      echo "Flag Error"
fi

if [[ "$1" = "-v"  || "$1" = "--version" ]] ; then
      echo "Version 1.0.0"
      echo "Creator 4TuNA@wnet.com"
      exit 1
      else 
        echo "Flag Error "	
fi


#Logo and info

clear

echo "Wnet corp. "
echo " "
echo "Created for Wnet by 4TuNA@wnet.ua © 2020"
echo " "
echo "###########################################################################################################"
echo "###########################################################################################################"
echo "###########################################################################################################"
echo "###########################################################################################################"
echo "#####################################################@=++=%@#######@%+-..:+@@@#############################"
echo "###############################################%++%####################@@*...*@@###########################"
echo "##########################################@+:%##########################@%+....%@##########################"
echo "######################@%%%%%%%%%%%@###@+-=#############@%%%%%%%%%%%@####@%=....+@##########################"
echo "######################%+++++++++++%#:-@###############%+++++++++++%#####@%+.. .=@##########################"
echo "######################=+++++++++++%#####=+++++%######%+++++++++++@#####@@%....:%@##########################"
echo "######################=+++++++++++@####=++++++%#####=+++++++++++@#####@@%....:%@###########################"
echo "######################=+++++++++++####=+++++++%####=+++++++++++######@@=....*%@############################"
echo "######################=+++++++++++###%++++++++@###=+++++++++++#######@:...-%@@###################@++#######"
echo "##################@@*#=+++++++++++##%+++++++++@##=+++++++++++#######@+=+:=@@####################@--%#######"
echo "###############@@=..-@+++++++++++=#%++++++++++@#=++++++++++=#######=*:-:+#########@=*:-:=######@--:***=####"
echo "#############@@+...*@@+++++++++++=%+++++++++++@=++++++++++=#####*--:++:---#####%:--*==*---=####--:****#####"
echo "###########@@=...-%@##+++++++++++++++++++++++++++++++++++%####*-:######*--###=--=#######--:###:-+##########"
echo "#########@@%-...=@@###++++++++++++++++==++++++++++++++++%####:-+######@--%##:-:========+--=##:-+###########"
echo "########@@+...:%@@####+++++++++++++++@##+++++++++++++++%####:-*#######--=##:-:***********=##:-*############"
echo "#######@%:...:%@######++++++++++++++%##@++++++++++****=*.%#*-*#######--=##=--=#######@#####*-:#############"
echo "######@%:...-%@@######+++++++++++++%###%+++++******:...=@#*-:#######:-+###@---*%@%*--:####@---=@%+*########"
echo "#####@%*.  .+%@#######++++++++++++%####=+******:....+@@##+-:#######:-+######+----:+@#######%:---:+#########"
echo "#####@%... .+%@#######+++++++++++=####@+***-....-**@#######################################################"
echo "#####@=... ..=%@@#####+++++++***+@@@@%+-....-:***+#########################################################"
echo "#####@%..   ..-=%%@@@@**********+:......-:*****+=##########################################################"
echo "######@=...     ..-::*---..........:=@=****++++%###########################################################"
echo "#######@@=-.................-:+%@@@@#######################################################################"
echo "#########@@@%%=++**++==%%@@@@@@############################################################################"
echo "###############@@@@@@@#####################################################################################"
echo "###########################################################################################################"
echo "###########################################################################################################"


#auth

echo "  " 
echo "Enter Password"

PASSWORD=""

while
read -s -n1 BUFF
[[ -n $BUFF ]]
do
    if [[ `printf "%d\n" \'$BUFF` == 127 ]]
    then
        PASSWORD="${PASSWORD%?}"
        echo -en "\b \b"
    else
        PASSWORD=$PASSWORD$BUFF
        echo -en "*"
    fi
done




echo " "
echo "Telnet connetcin on host $1 username $2"
echo " "

echo "Select a node firm"
echo " "
echo "1. Junipper"
echo "2. D-link"

read -s -n 1 choice  



echo " "

if [[ "$5" = "-vl"  || "$5" = "--vlan" ]] ; then
      echo "Check vlan on diagnostic"
      echo "Checl clan $6"
      
      else 
        echo "Flag Error "      
fi

echo " "
if [[ "$4" = "-d"  || "$4" = "--diagnostic" ]] ; then
      echo "Diagnostic $1"
      echo "Start diagnostic"
      echo " "
if [ $choice -eq "1" ]
then
        echo "Junipper"
        echo " "
        (
        sleep 2;
        echo -en "$2\r";
        sleep 1;
        echo -en "$PASSWORD\r";
        sleep 1;
        echo -ne "show interfaces $3"
        echo -ne '\n'
        sleep 1;
        echo -ne "show interfaces $3 extensive | match error"
        echo -ne '\n'
        sleep 1;
        echo -ne "show ethernet-switching table vlan $6"
        echo -ne '\n'
        sleep 1;
        ) | telnet $1

elif [ $choice -eq "2" ]
then
        echo "D-Link"  
        echo " " 
        (
        sleep 2;
        echo -en "$2\r";
        sleep 1;
        echo -en "$PASSWORD\r";
        sleep 1;
        echo -ne "show ports   $3"
        echo -ne '\n'
        sleep 1;
        echo -ne "clear error port $3"
        echo -ne '\n'
        sleep 1;
        echo -ne "show fdb port $3"
        echo -ne '\n'
        sleep 1;
	echo -ne "show fdb vlan $6"
        echo -ne '\n'
        sleep 1;

        ) | telnet $1
  
else
  echo "Wrong input"
fi




     

      else 

     


echo " "
if [ $choice -eq "1" ]
then
        echo "Junipper"
	echo " "
	(
	sleep 2;
	echo -en "$2\r";
	sleep 1;
	echo -en "$PASSWORD\r";
	sleep 1;
	echo -ne "show interfaces statistics $3 | match err"
	echo -ne '\n'
	sleep 1;
	echo -ne "clear interfaces statistics $3"
	echo -ne '\n'
	sleep 1;
	echo -ne "show interfaces statistics $3 | match err"
	echo -ne '\n'
	sleep 1;
	) | telnet $1

elif [ $choice -eq "2" ]
then
        echo "D-Link"  
	echo " " 
	(
        sleep 2;
        echo -en "$2\r";
        sleep 1;
        echo -en "$PASSWORD\r";
        sleep 1;
        echo -ne "show error ports $3"
        echo -ne '\n'
        sleep 1;
        echo -ne "clear counter ports $3"
        echo -ne '\n'
        sleep 1;
        echo -ne "show error ports $3"
        echo -ne '\n'
        sleep 1;
        ) | telnet $1
  
else
  echo "Wrong input"
fi

fi
