# Disk Status check V2

Quick jobbie whipped up to alert my team when there's a server with a disk getting full

Deploy script, add to crontab or systemd timer

If using systemd, edit the .timer and .service files to match your needs and environment.

**Be sure to set the proper hostname/vmname so you can find the server more easily if deployed to multiple machines!**

System will attempt to use its own if you don't, while alerting that it's not been set properly. 


