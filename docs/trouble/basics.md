
> This section of 314 Docs serves as an additional resource for troubleshooting steps when working with your Pi.
> 
> You will find basic steps on this page. In the menu can be found additional advice organized by major topics covered this quarter.

<br>

![debug image](../img/trouble/debug.png)

<br>

## Basic commands

* Remove SSH fingerprint warning: `ssh-keygen -R <hostName>.local`
* Turn off Pi: `​sudo poweroff`
* Reboot Pi: ​`sudo reboot now`


## Bricked Pi

> You were previously able to SSH into your Pi but are no longer able to.

**Option 1** : 

Use IPv6 instead of host name to SSH in. 

Find IPv6 address of Pi from a Macbook or an iMac in the TE lab:

`dns-sd -G v4v6 <hostName>.local` \

Example of output
```
13:05:31.382  Add        3 20 raspberrypi.local.  

FE80:0000:0000:0000:93D4:40CB:123C:B684%en10 120
```

Then SSH into it using ipv6
`ssh pi@<IPV6>%eth0`

> We're trying to avoid `mDNS`.

**Option 2** \
Connect pi to a monitor using the HDMI port, and plug in a keyboard and mouse. You should be able to navigate to the appropriate files to fix any issues. You can find all of the necessary equipment in the TE lab.

<br>

## Services
Control services by using the `systemctl` command.

* Restart services: `sudo systemctl restart <service name>`
* See whether a service is running or not:`sudo systemctl status <service name>`

<br>

## Logs

**Service logs** <br>
Check the last 100 lines of a service's logs. This is a great way to see if a service ran into any errors. 

* `sudo journcalctl -u <service name>`
* If you specficially only want to see the most recent parts of the log you can pipe the information it gives you into the tail command, which only shows any files' ending lines. `sudo journalctl -u <service name here>.service | tail -n 100`

**Check base logs** <br>
Use `nano` or preferably do `vim` on any of these and then SHIFT-G to get to end of file

* `/var/log/syslog` 
* `/var/log/messages` 
* `/var/log/kern.log`


