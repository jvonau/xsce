# XSCE School Server Platforms

## Operating Systems

* CentOS 7 64 bit version
* Fedora 22 and 23 (experimental) both 64 bit and 32 bit versions
* Fedora 18 32 bit on XO laptops

## Hardware Platforms

Theoretically the XSCE School Server should run on any machine that can run Centos 7 or Fedora 22 and 23.

In practice, XSCE has been tested on the following platforms and configurations.

#### NUC - Intel's Next Unit of Computing

Typically configured with 4 to 8 Gigabytes of RAM and 500G to 1TB of internal hard disk. Most models have a minimum of four USB ports and some have an internal wifi adapter.

- Tested with Centos 7.1 and Fedora 22 and 23.

#### OLPC XO-1.5, XO-1.75, XO-4

OLPC laptop with an external SD card of 32, 64, or 128 Gigabyte capacity and a subset of the content found on machines with more storage or with an external hard drive.

- Only Fedora 18 available.

#### Raspberry Pi 2

1 Gigabyte of RAM with an external micro SD card of 32, 64, or 128 Gigabyte capacity.  Four USB ports allow the addition of ethernet dongles, a wifi adapter, and possibly additional storage.

- Tested with Fedora 22.

#### VBox VM

Virtual machines with varying configurations, especially Centos 7 and Fedora, often used for testing or proof of concept.

#### Other Recent Intel Computers

A number of users have successfully deployed XSCE on late model desktop and laptop computers.

## Network Adapters

Each of the above devices may have one or more network adapters.  These may be internal ethernet, internal or external wifi, or ethernet dongles.  The role the server is able to play in the network will depend on what adapters and connections it has.

#### Sample Gateway Configurations

* WAN on internal WiFi and LAN on internal Ethernet
* WAN on internal Ethernet and LAN on internal or external WiFi as Access Point
* WAN on Ethernet dongle and LAN on internal Ethernet with optional bridged internal/external WiFi as Access Point

#### Sample Appliance Configurations

* Internal WiFi connected to an existing LAN
* Internal Ethernet connected to an existing LAN
* Ethernet dongle connected to an existing LAN
