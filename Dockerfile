FROM yueyehua/debian-base:latest
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"
LABEL version="1.0.0"

ENV DEBIAN_FRONTEND=noninteractive

# Apt update and upgrade
RUN \
  apt-get -qq update && \
  apt-get -qq dist-upgrade -y;

# Install ruby and dependencies
RUN \
  apt-get -qq -y install gcc git-core build-essential libffi-dev libssl-dev \
    libcurl4-openssl-dev libreadline-dev ruby;

# Clean all
RUN \
  apt-get -qq clean autoclean;

# Install few gems
RUN \
  gem install \
    -q --no-rdoc --no-ri --no-format-executable --no-user-install \
    rubocop yaml-lint bundler rspec;

VOLUME ["/sys/fs/cgroup"]
CMD  ["/bin/bash"]
