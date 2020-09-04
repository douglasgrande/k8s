#!/bin/bash

# mysql credential 
user="root"
pass="123456"

# list of all databases
all_dbs="$(mysql -u $user -p$pass -h localhost -Bse 'show databases' | egrep -i man_v3)"

for db in $all_dbs
do
    result=`mysql -u $user -p$pass -h localhost --database=$db -Bse "select RO.TXT_NAME, I.TXT_TYPE, json_extract(I.TXT_CONTENT, '$.name'), json_extract(I.TXT_CONTENT, '$.tags') from T_INTERCEPTOR I inner join T_API_COMPONENT_INTERCEPTOR ACI on ACI.ID = I.ID inner join T_API_COMPONENT AC on AC.ID = ACI.FK_API_COMPONENT_ID inner join T_SWAGGER_COMPONENT SC on SC.FK_API_COMPONENT_ID = AC.ID inner join T_API A on A.ID = SC.FK_API_ID inner join T_API_RESPONSIBLE AR on AR.ID = A.FK_API_RESPONSIBLE inner join T_ACCESS_CREDENTIAL ACR on ACR.ID = AR.FK_USER_ID inner join T_USER_ROLE UR on UR.FK_USER_ID = ACR.ID inner join T_ROLE RO on RO.ID = UR.FK_ROLE_ID where I.TXT_TYPE like 'CUSTOM';"`
    echo "Database: $db"
    echo "User \t Tipo \t Nome \t Tag"
    echo ""
    echo "$result"
    echo "-------------------------------------------------------------------------"
    echo ""
done
