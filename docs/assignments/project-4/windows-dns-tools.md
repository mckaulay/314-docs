# Windows DNS Tools

A common task in networking and web administration is querying DNS information. There are some websites which provide DNS lookup functionality, but these services are limited to returning records available on the public DNS.

When troubleshooting DNS configurations, it is often better to use a command-line tool, which will allow you to work with more flexibility. The following tools are available on Windows for this purpose:

- [`whois`](#whois) (can be installed from sysinternals)
- [`dig`](#dig) (can be installed with bind9 tools)
- [`resolve-dnsname`](#resolve-dnsname) (powershell cmd that can substitute for dig)
- [`nslookup`](#nslookup) (built-in tool with less-friendly UI)

## `whois`

`whois` is a DNS lookup tool included as a part of [Windows Sysinternals](https://docs.microsoft.com/en-us/sysinternals/), a set of advanced system utilities available from Microsoft for Windows systems.

### Installation

To use, download this utility from the [Microsoft download page](https://docs.microsoft.com/en-us/sysinternals/downloads/whois) and install it on your system by extracting the downloaded file and adding the directory containing it to the system path.

### Usage

Follow the usage documentation available on the tool's [download page](https://docs.microsoft.com/en-us/sysinternals/downloads/whois#usage):

```bash
whois [-v] domainname [whois.server]
```

Parameter | Description
---|---
-v | Print whois information for referrals

#### Example

```bash
$ whois uw.edu

Whois v1.20 - Domain information lookup
Copyright (C) 2005-2017 Mark Russinovich
Sysinternals - www.sysinternals.com

Connecting to EDU.whois-servers.net...

        University of Washington
        4545 15th Ave NE
        Suite 400
        Seattle, WA 98105-4527
        United States of America

Administrative Contact:
        Domain Admin
        University of Washington
        4545 15th Avenue NE
        Box 354840 UW-IT NOC
        Seattle, WA 98105-4527
        United States of America
        +1.2062216000
        uw-noc@uw.edu

Technical Contact:

        University of Washington
        4545 15th Avenue NE
        Box 354840 UW-IT NOC
        Seattle, WA 98105-4527
        United States of America
        +1.2062216000
        uw-noc@uw.edu

Name Servers:
        MARGE.CAC.WASHINGTON.EDU
        HANNA.CAC.WASHINGTON.EDU
        HOLLY.S.UW.EDU

Domain record activated:    05-Mar-1999
Domain record last updated: 19-Jun-2018
Domain expires:             31-Jul-2021

Connecting to  Washington...
No such host is known.
```

## `dig`
## `resolve-dnsname`
## `nslookup`

`nslookup` is a available and comes installed on Windows. This tool can be used to perform DNS queries from the command line for all types of DNS records.

### Usage

### Examples

Querying an A record (default behavior):

```bash
$ nslookup uw.edu
Server:  dlinkrouter
Address:  192.168.0.1

Non-authoritative answer:
Name:    uw.edu
Addresses:  128.95.155.134
          128.95.155.135
          128.95.155.197
          128.95.155.198
          54.214.77.106

```

Querying an MX record:

```bash
nslookup -type=mx wu.edu
Server:  dlinkrouter
Address:  192.168.0.1

Non-authoritative answer:
Non-authoritative answer:
uw.edu  MX preference = 100, mail exchanger = mxe25.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe26.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe27.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe28.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe29.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe30.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe31.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe32.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe21.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe22.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe23.s.uw.edu
uw.edu  MX preference = 100, mail exchanger = mxe24.s.uw.edu

```

Querying an authoritative server:

```bash
$ nslookup -type=soa wu.edu
Server:  dlinkrouter
Address:  192.168.0.1

Non-authoritative answer:
uw.edu
        primary name server = hanna.cac.washington.edu
        responsible mail addr = domainmaster.cac.washington.edu
        serial  = 2019040109
        refresh = 10800 (3 hours)
        retry   = 1800 (30 mins)
        expire  = 3600000 (41 days 16 hours)
        default TTL = 600 (10 mins)
```


## Resources

### `whois`
* https://docs.microsoft.com/en-us/sysinternals/

### `dig`
### `resolve-dnsname`
### `nslookup`
* https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/nslookup
* https://support.rackspace.com/how-to/nslookup-checking-dns-records-on-windows/