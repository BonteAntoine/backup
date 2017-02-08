#!/bin/bash

mail=cantraine.clement@gmail.com
#echo $mail

backupdir=/home/
#echo $backupdir

archivedir=~/srv/backup
# echo $archivedir

rm -Rf $archivedir/backup.2
mv $archivedir/backup.1 $archivedir/backup.2
mv $archivedir/backup.0 $archivedir/backup.1


options="-a --no-o --delete --safe-links \
--link-dest=$archivedir/backup.1 $backupdir $archivedir/backup.0/"

make_backup(){
	rsync $options         
}

move_backup(){
       	scp -r -p $archivedir clement@192.168.194.5:/srv/backup/
}

make_backup
move_backup
