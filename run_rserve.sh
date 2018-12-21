#!/bin/bash 

CONFIG_PATH=${RSERVE_HOME}/etc/Rserv.conf

R -e 'library(Rserve)' -e 'run.Rserve(config.file = "'${CONFIG_PATH}'")'
