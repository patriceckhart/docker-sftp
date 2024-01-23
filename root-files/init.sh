#!/bin/bash
set -ex

cp /root-files/opt/user.sh /usr/local/bin/user
chmod +x /usr/local/bin/user

rm /etc/ssh/sshd_config
cp /root-files/opt/sshd_config /etc/ssh/sshd_config
chmod -rw-r--r-- /usr/local/bin/user
yes | cp -rf /home/passwd /etc/passwd
yes | cp -rf /home/shadow /etc/shadow

echo "Starting ssh service ..."
service ssh start

echo "Container is up und running."
tail -f /dev/null
