.PHONY: 5.6 7.0 7.1
7.1:
	docker build -t hauptmedia/php:7.1 7.1
7.0:
	docker build -t hauptmedia/php:7.0 7.0
5.6:
	docker build -t hauptmedia/php:5.6 5.6

