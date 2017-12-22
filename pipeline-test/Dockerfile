from ubuntu:trusty

env DEBIAN_FRONTEND noninteractive

run apt-get update && apt-get install -y curl git &&\
	curl -sL https://deb.nodesource.com/setup_7.x | bash - &&\
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&\
	echo "mysql-server-5.5 mysql-server/root_password password codeurs" | debconf-set-selections &&\
	echo "mysql-server-5.5 mysql-server/root_password_again password codeurs" | debconf-set-selections &&\
	apt-get update && apt-get install -y --force-yes \
	mysql-server-5.5 mysql-client yarn php5-cli

run curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

workdir /app