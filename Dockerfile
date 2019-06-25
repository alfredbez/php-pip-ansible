FROM php:7.1.30

RUN apt-get update && apt-get install -y zlib1g-dev ssh libffi-dev python-dev libssl-dev rsync python-pip python-setuptools && \
	docker-php-ext-install bcmath && \
	docker-php-ext-install zip && \
	python -m pip install -U pip setuptools && \
	python -m pip install ansible
