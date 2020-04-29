#/usr/bin/bash

echo "> Starting backup..."

FILENAME=db-$(($(date +%s%N)/1000000)).sqlite3

docker run --rm --volumes-from=bitwarden_bitwarden_1 --entrypoint sqlite3 bruceforce/bw_backup /data/db.sqlite3 ".backup /data/backups/$FILENAME"

if [ $? -eq 0 ];then
    echo "> Backup Complete!"
    echo "> "$FILENAME
else
    echo "> Export failed!"
fi
