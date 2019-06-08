# docker-puppet:standard
#
# Version:     v0.2
# Project URL: https://github.com/ialokin/docker-puppet

FROM ruby:2.5-slim-stretch

RUN apt-get update && apt-get install -y \
    build-essential \
    yamllint \
    && rm -rf /var/lib/apt/lists/* \
    && gem install \
    r10k \
    puppet-lint \
    metadata-json-lint \
    rspec-puppet \
    rubocop