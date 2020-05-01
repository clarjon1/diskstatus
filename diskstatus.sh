#!/bin/bash

#Clarjon1's disk utilization alarm script
#Slap this where you want, toss it in cron, or customize the bundled systemd timers to point at the location of the script

# This can be modified to watch a specific mount point.
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
#Set this to the disk fill level before alarms will be sent (percentage)
THRESHOLD=10
# Set this to a value we can use to identify the VM with!
VMNAME="UNSET - best guess is $HOSTNAME"
DATE=$(date --iso)


if [ "$CURRENT" -gt "$THRESHOLD" ] ; then


#I've left this with sanitized versions of what was running as examples.

# Example 1: Microsoft Teams webhook with card
#curl -X POST -H "Content-Type: application/json" -d "{\"@type\": \"MessageCard\",\"@context\": \"https://schema.org/extensions\",\"summary\": \"$HOSTNAME triggered utilization threshold on $DATE\",\"themeColor\": \"0078D7\",\"title\": \"Disk Utilization Alarm\",\"sections\": [{\"activityTitle\": \"$VMNAME at $CURRENT percent\",\"activitySubtitle\": \"$DATE\",\"activityImage\": \"https://i.imgur.com/xKRxSbH.png\",\"facts\": [{\"name\": \"System:\",\"value\": \"$VMNAME\"}],\"text\": \"This message was sent because the disk utilization level has passed threshold of $THRESHOLD percent\"}]}" 'REPLACE_WITH_MS_TEAMS_WEBHOOK_URL'

# Example 2: Microsoft Flow
#curl -X POST -H "Content-Type: application/json" -d "{\"hostname\":\"$VMNAME\",\"percentage\":\"$CURRENT\",\"threshold\":\"$THRESHOLD\"}" 'REPLACE_WITH_MS_FLOW_WEBHOOK_URL'


fi

