debian-ruby
===========

This is a Debian Jessie docker image with ruby and rbenv installed.

Prerequisites
-------------

- Docker

Usage
-----

```text
docker pull yueyehua/debian-ruby
docker run \
  -d \                                           # daemonize
  --privileged \                                 # for systemd
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \          # for systemd
  --name ruby \                                  # container name
  -h ruby \                                      # hostname
  yueyehua/debian-ruby
docker exec -ti ruby bash
[Do something here]
docker stop ruby
docker rm ruby
```
