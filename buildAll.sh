#!/bin/bash

#copy the configuration file into the Mysql Building directory
cp ./tools/compile-pentium64-WrapLAMP ./Mysql/BUILD

pushd ./Mysql
	./BUILD/compile-pentium64-WrapLAMP
#	make install
popd


