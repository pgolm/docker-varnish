#!/bin/sh
set -e

# if command starts with an option, prepend mysqld
if [ "${1:0:1}" = '-' ]; then
	set -- varnishd $@
fi

if [ "$1" = 'varnishd' ]; then
	set $@ -F

	if [ -e /etc/varnish/default.vcl ]; then
		set $@ -f /etc/varnish/default.vcl
	fi

	if [ -e /etc/varnish/secret ]; then
		set $@ -S /etc/varnish/secret
	fi

	if [ ! -z $VARNISH_ADMIN_LISTEN ]; then
		set $@ -T $VARNISH_ADMIN_LISTEN
	fi
fi

exec $@
