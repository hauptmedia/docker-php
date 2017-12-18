FROM	debian:stretch
ENV	DEBIAN_FRONTEND noninteractive

# install required packges
RUN	apt-get update -qq && \
	apt-get upgrade -y && \
	apt-get install -y php7.0-cli \
	php7.0-mysqlnd php7.0-curl php7.0-apcu php7.0-xdebug php7.0-gd php7.0-sqlite php7.0-ssh2 php7.0-soap \
	php-pear mysql-client curl openssl sudo ca-certificates \
	g++ make cmake libssl-dev libgmp-dev php7.0-dev libpcre3-dev git && \
	apt-get clean autoclean && \
	apt-get autoremove --yes && \
	rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD	docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT	["/usr/local/sbin/docker-entrypoint.sh"]

