#!/bin/bash

# Define Variables
REMOTE_USER="root"
REMOTE_HOST="xx.xx.xxxx.xxx"
LOCAL_DIR="/opt/mpg_performance/"
PASSWORD="root"

# Define files and their respective remote directories
declare -A FILES_TO_FETCH
FILES_TO_FETCH["/gsn/pdp/abuja/active_pdp/"]="active_pdp.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/active_pdp/"]="attempted_pdp.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/available_ip/web/"]="utilization.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/credit/"]="control.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/service_pics/"]="util.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/dns_pkt_loss/"]="loss.txt"Feb-10-2025downlink.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/packet_loss/downlink/"]="downlink_loss.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/eps_active_bearer/"]="active_bearer.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/pdp_fail/web/"]="failure.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/packet_loss/uplink/"]="uplink_loss.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/rating-groups/"]="rating-groups.txt"
FILES_TO_FETCH["/gsn/pdp/abuja/throughput/uplink/"]="uplink.txt"

# Start the process of fetching multiple files
for REMOTE_DIR in "${!FILES_TO_FETCH[@]}"; do
  FILE="${FILES_TO_FETCH[$REMOTE_DIR]}"

  # Start SFTP session using expect for each file separately
  expect <<EOF
  spawn sftp ${REMOTE_USER}@${REMOTE_HOST}
  expect "password:"
  send "${PASSWORD}\r"
  expect "sftp>"
  send "lcd ${LOCAL_DIR}\r"
  expect "sftp>"

  # Change directory and fetch the file
  send "cd ${REMOTE_DIR}\r"
  expect "sftp>"
  send "get ${FILE}\r"
  expect "sftp>"

  # End session
  send "bye\r"
  expect eof
EOF

  echo "File ${FILE} downloaded from ${REMOTE_DIR} to ${LOCAL_DIR}"
done

echo "All files have been downloaded!"
