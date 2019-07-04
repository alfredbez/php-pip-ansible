FROM php:7.1.30

RUN apt-get update && apt-get install -y \
	wget mysql-client redis-server \
	git zlib1g-dev ssh libffi-dev libssl-dev rsync \
	python-dev python-pip python-setuptools && \
	docker-php-ext-install bcmath && \
	docker-php-ext-install zip && \
	docker-php-ext-install pdo_mysql && \
	sh -c 'printf "\n" | pecl install redis' && \
	docker-php-ext-enable redis && \
	python -m pip install -U pip setuptools && \
	python -m pip install ansible && \
	wget https://phar.phpunit.de/phpcpd.phar -O /usr/bin/phpcpd && \
	chmod +x /usr/bin/phpcpd

RUN redis-server --daemonize yes &

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
