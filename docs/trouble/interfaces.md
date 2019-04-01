
## systemd-networkd
- Static IP for your PI:
  - go to the `/etc/systemd/network/20-eth0.network`

```

[Match]
# We only want to match the eth0 interface
Name=eth0

# Provide full address config in abbreviated notation
[Network]
Address=192.168.69.1/26

# Enable link local addresses for IPv6 (FE80::)
LinkLocalAddressing=ipv6
```
Check if networkd is running: `sudo service systemd-networkd status`.
