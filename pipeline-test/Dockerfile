from ubuntu:trusty

env DEBIAN_FRONTEND noninteractive

run apt-get update && apt-get install -y curl &&\
	curl -sL https://deb.nodesource.com/setup_7.x | bash - &&\
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&\
	echo "deb http://ppa.launchpad.net/haxe/releases/ubuntu trusty main" >> etc/apt/sources.list &&\
	echo "deb-src http://ppa.launchpad.net/haxe/releases/ubuntu trusty main" >> etc/apt/sources.list &&\
	echo "mysql-server-5.5 mysql-server/root_password password codeurs" | debconf-set-selections &&\
	echo "mysql-server-5.5 mysql-server/root_password_again password codeurs" | debconf-set-selections &&\
	apt-get update && apt-get install -y --force-yes \
	mysql-server-5.5 mysql-client neko yarn

env LD_LIBRARY_PATH /usr/lib
run cp /usr/lib/libneko.so.2 /usr/lib/libneko.so

workdir /app

# service mysql start
# mysql -h localhost --user=root --password=codeurs -e "CREATE DATABASE cms_test;"
# yarn && yarn
# yarn test