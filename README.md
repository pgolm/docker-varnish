# About this Repo

[![Travis](https://img.shields.io/travis/pgolm/docker-varnish.svg)](https://travis-ci.org/pgolm/docker-varnish)
[![Docker Pulls](https://img.shields.io/docker/pulls/pgolm/varnish.svg)](https://hub.docker.com/r/pgolm/varnish/)
[![Docker Automated buil](https://img.shields.io/docker/automated/pgolm/varnish.svg)](https://hub.docker.com/r/pgolm/varnish/)

This is the git repo of the docker image of varnish. All [official vmods](https://github.com/varnish/varnish-modules) are included.

## Configure

You could pass arguments to configure `varnishd`.
Additionally the entrypoint looks if `/etc/varnish/default.vcl` exists and loads it if true.
