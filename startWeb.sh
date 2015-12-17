#!/bin/bash

source env.sh

#it's better manually start the mysql service
#sudo ${MysqlInstallingPath}/bin/mysqld_safe --user=mysql &
sudo ${ApacheInstallingPath}/bin/apachectl -k start

