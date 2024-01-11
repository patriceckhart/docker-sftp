#!/bin/bash

create() {
  current_timestamp=$(date +%s)
  adduser u"$current_timestamp"
  groupadd g"$current_timestamp"
  usermod -g g"$current_timestamp" u"$current_timestamp"
  chmod -R 775 /home/u"$current_timestamp"
}

if [ "$1" == "create" ]; then
  create
fi
