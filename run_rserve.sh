#!/bin/bash 

CONFIG_PATH=${RSERVE_HOME}/etc/Rserv.conf

R \
-e 'library(TTR)' \
-e 'library(forecast)' \
-e 'library(stats)' \
-e 'library(xts)' \
-e 'library(strucchange)' \
-e 'library(prophet)' \
-e 'library(Rserve)' \
-e 'run.Rserve(config.file = "'${CONFIG_PATH}'")'

