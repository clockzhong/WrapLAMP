#!/bin/bash

source env.sh

sudo userdel mysql
sudo groupdel mysql

#remove MYSQL installed directory
sudo rm -fr ${MysqlInstallingPath}

#remove Php installed direcotry
sudo rm -fr ${PhpInstallingPath}

#remove Apache installed direcotry
sudo rm -fr ${ApacheInstallingPath}

