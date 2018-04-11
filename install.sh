#! /bin/bash

cd /tmp/

apt-get -qq update

apt-get install -y apt-utils curl perl libpcre3 openssl procps postgresql postgresql-contrib sudo luarocks 

curl -sL https://bintray.com/kong/kong-community-edition-deb/download_file?file_path=dists/kong-community-edition-0.13.0.xenial.all.deb > kong.deb

dpkg -i kong.deb

service postgresql start

sudo -u postgres psql -c "CREATE USER kong"
sudo -u postgres psql -c "CREATE DATABASE kong OWNER kong"
sudo -u postgres psql -c "ALTER USER kong PASSWORD 'badpassword'"

cp kong.conf -p /etc/kong/
rm /etc/kong/kong.conf.default

kong migrations up

luarocks make

