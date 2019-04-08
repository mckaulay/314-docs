# Project 4 - Overview

In this assignment, we'll continue to extend the functionality of the Linux-based router by installing and configuring the open source BIND server to resolve DNS requests and cache responses on behalf of hosts on your LAN. This new functionality will take the place of the public DNS resolvers we used in the previous assignments (e.g., `1.1.1.1` or `8.8.8.8`).

## Project outline

Complete the tasks below. Once you are done answer the deliverable questions and submit your document.

1.  Follow [instructions](../setup) to install and test `tshark` on your Pi.
1.  Perform a capture of DNS queries being **routed through the Pi**:
    *  Setup your computer to use the Pi as a router (wifi disabled).
    *  Verify that your computer is configured to use a public DNS server (such as 1.1.1.1) via DHCP.
    *  Launch a `tshark` capture on the `wlan0` port of your Pi (see instructions below).
    *  Clear your computer's DNS cache and load a web page in your browser to trigger a DNS search.
1.  Install BIND on the router (see DO tutorial).
1.  Configure BIND as a caching DNS server (see DO tutorial).
    *  Adapt the instructions to use your IP address ranges.
    *  BIND should only be available on internal/LAN address ranges.
    *  Add an additional line to `/etc/bind/named.conf.options` before `dnssec-validation auto;`. The new line should read `dnssec-enable no;`. This is necessary due to the limitations of using a Pi versus an always on network server.
    *  Stop after you complete the caching DNS server part of the tutorial.
1.  Update DHCP server configuration so that your Pi will be used as the domain name server for the LAN.
    *  Be sure to restart the DHCP service to load the new configuration (`sudo systemctl restart isc-dhcp-server`).
    *  Refresh the DHCP settings for your computer by temporarily disconnecting the network cable.
    *  Verify that your computer receives the updated parameters from DHCP.
1.  Perform a capture of DNS queries being **resolved by your Pi**:
    *  Setup your computer to use the Pi as a router (wifi disabled).
    *  Verify that your computer is configured to use your Pi as a DNS resolver.
    *  Clear the BIND DNS cache on the Pi by running `sudo rndc flush`.
    *  Launch a `tshark` capture on the `wlan0` port of your Pi (see instructions below).
    *  Clear your computer's DNS cache and load a web page in your browser to trigger a DNS search.
1.  Perform a capture of DNS queries being made **from your Pi**:
    *  Launch a `tshark` capture on the `wlan0` port of your Pi (see instructions below).
    *  Open a second `ssh` connection to your Pi (if needed) and trigger a DNS query by using `ping` to test a public server by domain name, e.g., `ping google.com` (use `CTRL-C` to stop ping).

## References
* [A Comparison of DNS Server Types](https://www.digitalocean.com/community/tutorials/a-comparison-of-dns-server-types-how-to-choose-the-right-dns-configuration)
* [How to Configure Bind as a Caching or Forwarding DNS Server](https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-caching-or-forwarding-dns-server-on-ubuntu-14-04)
