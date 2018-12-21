FROM artemklevtsov/r-alpine:latest

RUN R -e "install.packages('TTR', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('xts', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('forecast', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('Rserve', repos='http://cran.us.r-project.org')"

RUN mkdir -p /opt/rserve
ENV RSERVE_HOME /opt/rserve

COPY etc ${RSERVE_HOME}/etc
COPY run_rserve.sh ${RSERVE_HOME}/bin/
RUN chmod 755 ${RSERVE_HOME}/bin/run_rserve.sh

RUN mkdir ${RSERVE_HOME}/work

EXPOSE 6311

#HEALTHCHECK --interval=2s --timeout=3s \
# CMD sleep 1 | \
# 		telnet localhost 6311 | \
#		grep -q Rsrv0103QAP1 || exit 1

CMD ["/opt/rserve/bin/run_rserve.sh"]
