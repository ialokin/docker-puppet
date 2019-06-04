# docker-puppet
#
# Version:     v0.1
# Project URL: https://github.com/ialokin/docker-puppet

FROM debian:stretch-slim

# Make sure we have some basic packages needed later
RUN apt-get update && apt-get install -y \
    locales \
    gnupg

# Make en_US.UTF-8 the default locale
ENV LANG en_US.utf8
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Add the puppetlabs repository
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 6F6B15509CF8E59E6E469F327F438280EF8D349F \
    && echo "deb http://apt.puppetlabs.com stretch main" > /etc/apt/sources.list.d/puppetlabs.list
    

# Install the packages we want ;)
RUN apt-get update && apt-get install -y \
    lsb \
    pdk \
    yamllint

# Cleanup
RUN rm -rf /var/lib/apt/lists/*