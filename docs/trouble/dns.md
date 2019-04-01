

> Most of our work is done in: `/etc/bind/zones/`



## Troubleshoot
* `systemctl status bind9` and check whether the server is up
* `named-checkconf -z` within `/etc/bind` and make sure you are clear of general configuration errors
* `named-checkzone subdomain.domain.com /etc/bind/zones/db.subdomain.domain.com` make sure your zone file is correct
* add `127.0.0.1` to your listen on for `/etc/bind/named.conf.options`
  * `dig @127.0.0.1 mx mail.domain.pi` to see if the you can resolve your own name server from the pi
* * `named.conf.options` 
    * have a listen-on for the right IP?
    * allow-query for the right hosts
* `dhcpd.conf` have the right domain name and the right `domain-name-servers`
* `named.conf.local` pulling in the right file



## To add

- [ ] Clear DNS cache on laptop for all three ifconfig release and renew