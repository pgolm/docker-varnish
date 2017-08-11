FROM alpine:3.6

ARG VARNISH_VERSION=5.1.3-r0
ARG MODULE_VERSION=0.12.1

LABEL maintainer="Peter Golm <golm.peter@gmail.com>" \
      varnish.version=$VARNISH_VERSION               \
      varnish_module.version=$MODULE_VERSION

# install Varnish
RUN \
  apk update &&                                               \
  apk upgrade &&                                              \
  apk add --update ca-certificates openssl &&                 \
  update-ca-certificates &&                                   \
  apk add                                                     \
    --no-cache                                                \
    --repository http://dl-3.alpinelinux.org/alpine/edge/main \
    varnish=${VARNISH_VERSION}                                \
    varnish-dev=${VARNISH_VERSION}                            \
    varnish-libs=${VARNISH_VERSION}

# build & install & cleanup varnish modules
RUN \
  cd /tmp &&                                                                                                    \
  apk add                                                                                                       \
    --no-cache                                                                                                  \
    --repository http://dl-3.alpinelinux.org/alpine/edge/main                                                   \
    varnish-dev=${VARNISH_VERSION} &&                                                                           \
  apk add                                                                                                       \
    --no-cache                                                                                                  \
    autoconf automake libtool make py-docutils python &&                                                        \
  wget -O varnish_modules.tar.gz https://github.com/varnish/varnish-modules/archive/${MODULE_VERSION}.tar.gz && \
  tar -zxf varnish_modules.tar.gz &&                                                                            \
  cd varnish-modules-${MODULE_VERSION} && ./bootstrap && ./configure && make && make install &&                 \
  cd .. && rm -fr varnish-modules-${MODULE_VERSION} &&                                                          \
  apk del varnish-dev autoconf automake make libtool python py-docutils

WORKDIR /

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["-?"]
