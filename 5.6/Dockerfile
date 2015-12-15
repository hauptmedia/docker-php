FROM	debian:jessie
ENV	DEBIAN_FRONTEND noninteractive

# install required packges
RUN	apt-get update -qq && \
	apt-get upgrade -y && \
	apt-get install -y php5-cli \
	php5-mysqlnd php5-curl php5-apcu php5-xdebug php5-gd php5-sqlite php5-ssh2 \
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

# integrate zend loader
ENV	ZEND_GUARD_LOADER_VERSION 7.0.0

RUN	curl -L --silent http://downloads.zend.com/guard/${ZEND_GUARD_LOADER_VERSION}/zend-loader-php5.6-linux-x86_64.tar.gz | tar -xz --strip=1 -C /tmp && \
	mkdir -p /usr/lib/php5/zend-loader && \
	cp /tmp/ZendGuardLoader.so /tmp/opcache.so /usr/lib/php5/zend-loader/ && \
   	echo "zend_extension=/usr/lib/php5/zend-loader/ZendGuardLoader.so" >/etc/php5/mods-available/zend_guard_loader.ini && \
   	echo "zend_extension=/usr/lib/php5/zend-loader/opcache.so" >>/etc/php5/mods-available/zend_guard_loader.ini && \
	rm -rf /tmp/*

# integrate librdkafka
ENV	LIBRDKAFKA_VERSION 0.8.6-1

RUN	mkdir -p /usr/src/librdkafka && \
	curl -L --silent https://github.com/edenhill/librdkafka/archive/debian/${LIBRDKAFKA_VERSION}.tar.gz | tar -xz --strip=1 -C /usr/src/librdkafka && \
	cd /usr/src/librdkafka && \
	dpkg-buildpackage -B && \
	dpkg -i /usr/src/librdkafka1_${LIBRDKAFKA_VERSION}_amd64.deb && \
	dpkg -i /usr/src/librdkafka-dev_${LIBRDKAFKA_VERSION}_amd64.deb 

# integrate rdkafka extension
ENV     RDKAFKA_PHP_GIT_SHA1 416a0f992a0d657cf4cdfbe90ad18f882db79e0a

RUN     git clone -o ${RDKAFKA_PHP_GIT_SHA1} https://github.com/arnaud-lb/php-rdkafka /usr/src/php-rdkafka && \
        cd /usr/src/php-rdkafka && \
        phpize && \
        ./configure && \
        make && \
        make install && \
        echo "; RdKafka Extension\nextension=rdkafka.so" >/etc/php5/mods-available/rdkafka.ini


ADD	docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT	["/usr/local/sbin/docker-entrypoint.sh"]

