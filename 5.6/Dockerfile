FROM	debian:jessie
ENV	DEBIAN_FRONTEND noninteractive

# install required packges
RUN	apt-get update -qq && \
	apt-get upgrade -y && \
	apt-get install -y php5-cli php5-mysql php5-curl php5-apcu php5-xdebug php5-sqlite php-pear mysql-client curl openssl \
	g++ make cmake libuv-dev libssl-dev libgmp-dev php5-dev libpcre3-dev git && \
	apt-get clean autoclean && \
	apt-get autoremove --yes && \
	rm -rf /var/lib/{apt,dpkg,cache,log}/

# integrate cassandra php connector
ENV	CASSANDRA_PHP_DRIVER_GIT_TAG v1.0.0

RUN	git clone --branch ${CASSANDRA_PHP_DRIVER_GIT_TAG} https://github.com/datastax/php-driver.git /usr/src/datastax-php-driver && \
	cd /usr/src/datastax-php-driver && \
	git submodule update --init && \
	cd ext && \
	./install.sh && \
	echo "; DataStax PHP Driver\nextension=cassandra.so" >/etc/php5/mods-available/cassandra.ini

RUN	sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

