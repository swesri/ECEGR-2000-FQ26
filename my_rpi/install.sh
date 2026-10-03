#!/bin/bash

# Description: Append /etc/rc.local file with push_my_ip.sh"


ME=$(whoami)
sed -i "s|^USER=|USER=${ME}|g" ${PWD}/scripts/push_my_ip.sh

if grep "push_my_ip.sh" /etc/rc.local >/dev/null 2>&1 ; then
  echo "push_my_ip.sh already in /etc/rc.local"
else
  sed -i "s|^USER=|USER=${ME}|g" ${PWD}/scripts/push_my_ip.sh
  sudo sed -i "s|^exit 0|sudo -u ${ME} /bin/bash ${PWD}/scripts/push_my_ip.sh \&\n\nexit 0|g" /etc/rc.local
  echo "push_my_ip.sh call added to /etc/rc.local"
fi
