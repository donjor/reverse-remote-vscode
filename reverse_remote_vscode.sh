#!/bin/bash

#echo "REVERSE REMOTE VSCODE STARTED"

PORT=1234
REMOTEUSER=yourremoteuser
REMOTESERVER=yourremoteserver

$(nohup ssh -f -N -R $PORT:localhost:$PORT $REMOTEUSER@$REMOTESERVER >/dev/null 2>&1 &)

while true
do
  path=$(nc -ld 1234 &)
  if [[ -n "$path" ]]
  then
    echo "Firing vscode with remote path: $path"
    $(code --folder-uri vscode-remote://ssh-remote+$REMOTESERVER$path)
  fi
done
