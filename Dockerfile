# docker-puppet
#
# Version:     v0.1
# Project URL: https://github.com/ialokin/docker-puppet

FROM debian:stretch-slim

# Make sure we have some basic packages needed later
RUN apt-get update && apt-get install -y \
    locales \
    gnupg \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Make en_US.UTF-8 the default locale
ENV LANG en_US.utf8
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Add the puppetlabs repository and install the tools we want
RUN wget -O /tmp/puppet-release-stretch.deb http://apt.puppetlabs.com/puppet-release-stretch.deb \
    && dpkg -i /tmp/puppet-release-stretch.deb \
    && apt-get update && apt-get install -y \
    lsb \
    pdk \
    yamllint \
    && /opt/puppetlabs/puppet/bin/gem install r10k \
    && rm -rf /var/lib/apt/lists/*