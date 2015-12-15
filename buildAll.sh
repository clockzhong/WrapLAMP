#!/bin/bash

source env.sh


echo Build Mysql now
pushd ./Mysql
	cmake . -DCMAKE_INSTALL_PREFIX=${MysqlInstallingPath} -DWITH_BOOST=${CurrentPath}/Boost
	make install
popd
echo Building on MYSQL done!!!!!!!!!!!!!!



echo Start to configure MYSQL
sudo groupadd mysql
sudo useradd -r -g mysql -s /bin/false mysql
pushd ${MysqlInstallingPath}
	sudo chown -R mysql .
	sudo chgrp -R mysql .
	sudo bin/mysqld --initialize --user=mysql
	sudo bin/mysql_ssl_rsa_setup
	sudo chown -R root .
	sudo chown -R mysql data
## This mysql server start is optional
##	sudo bin/mysqld_safe --user=mysql &

#add this symbol link file to fix a building bug in PHP 
popd ${MysqlInstallingPath}/lib
	sudo ln -s ./libmysqlclient.so ./libmysqlclient_r.so
popd

popd 

echo Configuration on MYSQL done


echo Start to build Apache
##Prepare for apacheAPR
cp -a ./ApacheApr ./Apache/srclib/apr
pushd ./Apache/srclib/apr
	./buildconf	
popd

pushd ./Apache
	./configure --prefix=${ApacheInstallingPath} --enable-so
	make
	make install
popd

echo Apache building done

echo Start to build php
pushd ./Php
	./configure --with-apxs2=${ApacheInstallingPath}/bin/apxs --prefix=${PhpInstallingPath} --with-pdo-mysql --with-mysql=${MysqlInstallingPath}
	make
	make install	
popd
echo Php Building done




