##
## XS config make file
##
## See /usr/share/doc/xs-config-<version>/README for
## how this works...
##
earlyset: rsyslog.conf motd sysctl.conf ssh/sshd_config \
     sysconfig/named sysconfig/init \
     sysconfig/iptables-config sysconfig/squid \
     sudoers rssh.conf php.ini sysconfig/httpd \
     init.d/squid sysconfig/ejabberd \
     sysconfig/network-scripts/ifcfg-eth0 sysconfig/network-scripts/ifcfg-eth1 \
     httpd/conf.d/proxy_ajp.conf httpd/conf.d/ssl.conf

networkset: hosts sysconfig/dhcpd

# Any file that has a ".in"
# 'template' can be made with this catch-all
# that is just a straight cp -p right now.
##
##  - Do not use with resolv.conf, idmgr.conf.in
##       or named-xs.conf.in
##  - If you add a more specific rule it will
##    override this rule for your target.
% :: %.in
	# It may be dirty
	xs-commitchanged -m 'Dirty state' $@
	# Overwrite
	cp -p $@.in $@
	xs-commitchanged -m "Made from $@.in" $@

sysctl.conf:
	xs-commitchanged -m 'Dirty state' $@
	cp -p $@.in $@
	xs-commitchanged -m "Made from $@.in" $@
	sysctl -p $@

sysconfig/network-scripts/ifcfg-eth0:
	xs-commitchanged -m 'Dirty state' $@
	cp -p sysconfig/olpc-scripts/ifcfg-eth0 $@
	xs-commitchanged -m "Made from olpc-scripts" $@

sysconfig/network-scripts/ifcfg-eth1:
	xs-commitchanged -m 'Dirty state' $@
	cp -p sysconfig/olpc-scripts/ifcfg-eth1 $@
	xs-commitchanged -m "Made from olpc-scripts" $@

sudoers: sudoers.d/*
	touch sudoers.tmp
	chmod 640 sudoers.tmp
	cat-parts sudoers.d > sudoers.tmp
	chmod 440 sudoers.tmp
	xs-commitchanged -m 'Dirty state' $@
	mv -f sudoers.tmp sudoers
	xs-commitchanged -m "Made from sudoers.d" $@

dhcpd-xs.conf:  sysconfig/xs_server_number sysconfig/xs_domain_name
	xs-commitchanged -m 'Dirty state' $@
	#SERVERNUM := $(shell cat sysconfig/xs_server_number)
	#BASEDNSNAME := $(shell cat sysconfig/xs_domain_name)
	cp /etc/sysconfig/olpc-scripts/dhcpd.conf.$(shell cat sysconfig/xs_server_number) $@.tmp
	sed -i -e "s/@@BASEDNSNAME@@/$(shell cat sysconfig/xs_domain_name)/" $@.tmp
	mv $@.tmp $@
	xs-commitchanged -m "Made from /etc/sysconfig/olpc-scripts/dhcpd.conf.${SERVERNUM}" $@

