

## Troubleshoot

- Check DHCP errors `journalctl -u isc-dhcp-server`
- check subnet range in `dhcpd.conf` 
-  Check what wifi your pi is using the appropriate wifi
   -  `wpa_cli -i wlan0 status` 
-  Make sure both `dhcpd` and `systemd` are declaring the same statis IP for the Pi.
-  Check your leases in `at /var/lib/dhcp/dhcpd.leases`


## To add

- [ ] When and how to renew DHCP leases on laptop for windows, unix, and linux