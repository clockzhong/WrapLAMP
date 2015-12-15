#!/bin/bash

source env.sh

sudo userdel mysql
sudo groupdel mysql

#remove MYSQL installed directory
rm -fr ${MysqlInstallingPath}


