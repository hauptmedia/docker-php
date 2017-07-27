#!/bin/sh

if [ -z "$TIMEZONE" ]; then
	TIMEZONE=Etc/UTC
fi

echo $TIMEZONE > /etc/timezone && \
dpkg-reconfigure -f noninteractive tzdata

sed -i "s|;date.timezone =.*|date.timezone = $TIMEZONE|" /etc/php/7.0/*/php.ini

if [ -n "$PHP_MEMORY_LIMIT" ]; then
	sed -i "s/^memory_limit =.*/memory_limit = $PHP_MEMORY_LIMIT/" /etc/php/7.0/*/php.ini
fi

exec "$@"
