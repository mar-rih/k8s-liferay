#!/bin/bash
#My first script

PSG_CNT_NAME=$1 #"postgresdb";
PSG_DB_NAME=${MEDAD_DATABASE} #"medad-Client11";
PSG_UNAME=${PGUSER} #"admin";
PSG_PASS=${PGPASSWORD} #"1q2q2w3w";
PSG_PORTNUM=$5
PSQL_CONN="";

PSGHOST=${PGHOST}



PSQL_CONN="psql ";
#yum -y update
#yum -y install postgresql
eval $PSQL_CONN -c \""\l"\"
if  [ $? -gt "0" ]; then
        echo "POSTGRES does not exist."
        exit;
fi
sed -i -e 's/'"<SS_DB_HOST>"'/'"$PSGHOST"'/g' liferay_6.2/lep/portal-ext.properties
sed -i -e 's/'"<SS_DB_CLIENT>"'/'"$PSG_DB_NAME"'/g' liferay_6.2/lep/portal-ext.properties
sed -i -e 's/'"<SS_DB_UNAME>"'/'"$PSG_UNAME"'/g' liferay_6.2/lep/portal-ext.properties
sed -i -e 's/'"<SS_DB_PASS>"'/'"$PSG_PASS"'/g' liferay_6.2/lep/portal-ext.properties

eval $PSQL_CONN -c \""\c $PSG_DB_NAME;"\"
if [ $? -gt 0 ];then
        echo "Creating Database. "
        echo  $PSQL_CONN -c \""CREATE DATABASE $PSG_DB_NAME;"\"
        eval $PSQL_CONN -c \""CREATE DATABASE $PSG_DB_NAME;"\"
        if [ $? -eq 0 ]; then
                        echo "Grant user access."
                        eval $PSQL_CONN -c \""GRANT ALL PRIVILEGES ON DATABASE $PSG_DB_NAME TO $PSG_UNAME;"\";
        fi
        if [ $? -gt 0 ]; then 
			exit;
        fi
fi

#docker login -u $DCKR_REG_U -p $DCKR_REG_P
#docker build -t mar-rih/naseej-medad:$PSG_DB_NAME ./liferay_6.2
#docker logout
