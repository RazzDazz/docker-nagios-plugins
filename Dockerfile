FROM razzle/docker-nagios-core:latest
MAINTAINER RazzDazz
# Using instructions from 
# https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source.html#Ubuntu

ENV REFRESHED_AT 2017-06-24
ENV DEBIAN_FRONTEND noninteractive

#
# Install nagios plugins
#

ENV NAGIOS_PLUGINS_TAR release-2.2.1.tar.gz
ENV NAGIOS_PLUGINS_DIR nagioscore-nagios-4.3.2

# Install missing packages
RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get -yqq install \
                 autoconf \
                 gcc \
                 libc6 \
                 libmcrypt-dev \
                 make \
                 libssl-dev \
                 wget \
                 bc \
                 gawk \
                 dc \
                 build-essential \
                 snmp \
                 libnet-snmp-perl \
                 gettext && \
    rm -rf /var/lib/apt/lists/*

# Download and extract nagios sourcen
RUN mkdir -p /tmp/nagios-plugins && \
    cd /tmp/nagios-plugins/ && \
    wget -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/$NAGIOS_PLUGINS_TAR} && \
    tar zxvf nagios-plugins.tar.gz && \
    rm -f nagios-plugins.tar.gz

# wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz

# Compile
#RUN cd /tmp/nagios/${NAGIOS_PLUGINS_DIR}/ && \
#    ./tools/setup && \
#    ./configure && \
#    make all && \
#    make install && \
#   make clean

# run shell to keep container alive for testing
CMD  /bin/bash

# Start apache2
# apache2ctl start
# Start nagios
# /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
#
