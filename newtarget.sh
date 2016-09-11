#/bin/bash
#Created for Astophotographers to create a repeatable directory structure on OSX platform. (May work on Linux) 
#Untested on Windows 10 with bash installed
#Author Grant McKechnie @mckechg 

clear
#variables
SESSION_DATE=`date "+%Y-%m-%d"`
DIR_STRUCT="${SESSION_DATE}/RAW/LIGHTS ${SESSION_DATE}/RAW/DARKS ${SESSION_DATE}/RAW/BIAS ${SESSION_DATE}/RAW/FLATS ${SESSION_DATE}/PROCESS/CALIBRATED ${SESSION_DATE}/PROCESS/REGISTERED ${SESSION_DATE}/PROCESS/ALIGNED ${SESSION_DATE}/PROCESS/WORKING"

if [ -z $1 ] 
	then
echo "You forgot the Targetname"
	exit 1
fi
TARGET=$1
cd ${HOME}/Pictures
echo "Moved to `pwd`"
if [ -d ${TARGET} ]
then
	echo "$TARGET Directory already exists"
else
	mkdir ${TARGET}
	if [ $? = 0 ] 
	then
		echo "$TARGET created successfully"
	else
		echo "diretory $TARGET creation failed"
		exit 2
	fi
fi 

cd ${HOME}/Pictures/${TARGET}
echo "Creating Directory Structure"
sleep 2
for DIRECTORY in ${DIR_STRUCT}
do 
	echo "Creating ${DIRECTORY}"
	mkdir -pv ${DIRECTORY}
	if [ $? = 0 ] 
        	then 
                echo "${DIRECTORY} created successfully"
        else
                echo "diretory ${DIRECTORY} creation failed"
	exit 2
        fi
done

