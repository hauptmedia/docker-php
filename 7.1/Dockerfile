FROM	debian:buster
ENV	DEBIAN_FRONTEND noninteractive

# install required packges
RUN	apt-get update -qq && \
	apt-get upgrade -y && \
	apt-get install -y php7.1-cli \
	php7.1-mysqlnd php7.1-curl php7.1-gd php7.1-sqlite php7.1-xml php7.1-dom \
	php-pear curl openssl sudo ca-certificates \
	g++ make cmake libssl-dev libgmp-dev php7.1-dev libpcre3-dev git && \
	apt-get clean autoclean && \
	apt-get autoremove --yes && \
	rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD	docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT	["/usr/local/sbin/docker-entrypoint.sh"]

