FROM yueyehua/debian-base:8
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"
LABEL version="1.0.0"

ENV _RUBY_VERSION=2.4.0

# Apt update and upgrade
RUN \
  apt-get -qq update && \
  apt-get -qq dist-upgrade -y;

# Install ruby dependencies
RUN \
  apt-get -qq -y install gcc git-core build-essential libffi-dev libssl-dev \
    libcurl4-openssl-dev libreadline-dev

# Clean all
RUN \
  apt-get -qq clean autoclean;

# Install rbenv
RUN \
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
  git clone https://github.com/rbenv/ruby-build.git \
    ~/.rbenv/plugins/ruby-build;

# Install Ruby
RUN \
  /root/.rbenv/bin/rbenv install ${_RUBY_VERSION} && \
  /root/.rbenv/bin/rbenv global ${_RUBY_VERSION};

# Export PATH
ENV PATH=$PATH:/root/.rbenv/bin:/root/.rbenv/shims

# Check rbenv installation
RUN \
  curl -fsSL \
    https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | \
    bash

# Install few gems
RUN \
  /root/.rbenv/shims/gem install \
    -q --no-rdoc --no-ri --no-format-executable --no-user-install \
    rubocop yaml-lint bundler rspec;

VOLUME ["/sys/fs/cgroup"]
CMD  ["/lib/systemd/systemd"]
