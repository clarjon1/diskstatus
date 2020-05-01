# Disk Status check V2

This is a script I whipped up a while back to alert me at work when certain severs disks were getting full. It's certaintly saved my bacon a few times!

# Usage

Clone from git with `git clone https://github.com/clarjon1/diskstatus` and start editing values.

Set THRESHOLD to the fill percentage you want the system to be alerting at. Default set to 10% full as most disks I deployed this to was past this, so it'd alert and let me know that stuff was working immediately.

**Be sure to set the proper hostname/vmname so you can find the server more easily if deployed to multiple machines!**

System will attempt to use its own if you don't, while alerting that it's not been set properly.

To change what disk it'll monitor, edit the CURRENT variable.
For example, to monitor mountpoint /mnt/disky
Change:
```
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
```

to

```
CURRENT=$(df /mnt/disky | grep / | awk '{ print $5}' | sed 's/%//g')
```

_Note: To monitor more than one disk with the same script, I've just copied the contents of the script repeatedly into itself for some deployments. Works a treat!_

In the loop where the examples are, set the command you want fired off when the threshold is surpassed. For many modern applications, curl to interact with the webhook will be the standard, and I've given a couple examples of two different webhooks. 

_note: Please send pull requests with more examples if you'd like, so I can have a whole host of 'quickstart' examples so folks can save some dev time in the future!_

If using systemd, edit the .timer and .service files to match your needs and environment. In particular, the .service file needs to be changed to point at the path you've installed the script to.

# Deployment

Ensure the script is executable, (`chmod +x diskstatus.sh`) and add to cron or install the systemd unit files.

You can test if the script is firing properly with `systemctl start diskstatus.service`

To get the timer started, use `systemctl start diskstatus.timer ; systemctl enable diskstatus.timer` to start it for this session, and ensure it'll be started when the box reboots. 

 


