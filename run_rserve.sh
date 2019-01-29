#!/bin/bash 

CONFIG_PATH=${RSERVE_HOME}/etc/Rserv.conf

R \
-e 'library(TTR)' \
-e 'library(forecast)' \
-e 'library(stats)' \
-e 'library(xts)' \
-e 'library(strucchange)' \
-e 'library(prophet)' \
-e 'library(data.table)' \
-e 'library(AnomalyDetection)' \
-e 'library(Rtsne)' \
-e 'library(Rserve)' \
-e 'run.Rserve(config.file = "'${CONFIG_PATH}'")'

