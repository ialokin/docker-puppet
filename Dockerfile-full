# docker-puppet:full
#
# Version:     v0.2
# Project URL: https://github.com/ialokin/docker-puppet

FROM debian:stretch-slim

RUN apt-get update && apt-get install -y \
    locales \
    gnupg \
    wget \
    yamllint \
    lsb \
    && wget -O /tmp/puppet-release-stretch.deb http://apt.puppetlabs.com/puppet-release-stretch.deb \
    && dpkg -i /tmp/puppet-release-stretch.deb \
    && apt-get update && apt-get install -y \
    lsb \
    pdk \
    yamllint \
    puppet-agent \
    && rm -rf /var/lib/apt/lists/* \
    && /opt/puppetlabs/puppet/bin/gem install r10k  \