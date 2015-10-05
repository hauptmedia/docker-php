# docker-php

This container can be used as base image for php applications.

## Installed PHP Extensions
* acpu
* cassandra (must be enabled via `php5enmod cassandra`)
* curl
* gd
* mysql
* ssh2
* sqlite
* xdebug
* zend_guard_loader (must be enabled via `php5dismod opcache && php5enmod zend_guard_loader`)

## Available Tags

`5.6`- Debian jessie based PHP 5.6 image

## Available Environment Variables

* `TIMEZONE` - sets the container / PHP timezone (default: Etc/UTC)
* `PHP_MEMORY_LIMIT` - sets the php memory_limit

