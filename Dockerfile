# docker-puppet
#
# Version:     v0.1
# Project URL: https://github.com/ialokin/docker-puppet

FROM debian:stretch-slim

# Make en_US.UTF-8 the default locale
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Add the puppetlabs repository
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 6F6B15509CF8E59E6E469F327F438280EF8D349F \
    && echo "deb http://apt.puppetlabs.com stretch main" > /etc/apt/sources.list.d/puppetlabs..list

# Install the packages we want ;)
RUN apt-get update && apt-get install -y \
    lsb \
    puppet-agent \
    pdk \
    yamllint \
    && rm -rf /var/lib/apt/lists/* \