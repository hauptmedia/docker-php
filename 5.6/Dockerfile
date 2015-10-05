FROM	debian:jessie
ENV	DEBIAN_FRONTEND noninteractive

# install required packges
RUN	apt-get update -qq && \
	apt-get upgrade -y && \
	apt-get install -y php5-cli \
	php5-mysql php5-curl php5-apcu php5-xdebug php5-gd php5-sqlite php5-ssh2 \
	php-pear mysql-client curl openssl sudo ca-certificates \
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

# integrated zend loader
ENV	ZEND_GUARD_LOADER_VERSION 7.0.0

RUN	curl -L --silent http://downloads.zend.com/guard/${ZEND_GUARD_LOADER_VERSION}/zend-loader-php5.6-linux-x86_64.tar.gz | tar -xz --strip=1 -C /tmp && \
	mkdir -p /usr/lib/php5/zend-loader && \
	cp /tmp/ZendGuardLoader.so /tmp/opcache.so /usr/lib/php5/zend-loader/ && \
   	echo "zend_extension=/usr/lib/php5/zend-loader/ZendGuardLoader.so" >/etc/php5/mods-available/zend_guard_loader.ini && \
   	echo "zend_extension=/usr/lib/php5/zend-loader/opcache.so" >>/etc/php5/mods-available/zend_guard_loader.ini && \
	rm -rf /tmp/*


ADD	docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT	["/usr/local/sbin/docker-entrypoint.sh"]

