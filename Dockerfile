FROM debian:stable-slim

RUN apt update && \
    apt upgrade -y && \
    apt install -y apt-cacher-ng && \
    apt clean && \
    sed -i -e 's/^Remap/# Remap/' /etc/apt-cacher-ng/acng.conf

RUN ln -s /dev/stderr /var/log/apt-cacher-ng/apt-cacher.err && \
    ln -s /dev/stdout /var/log/apt-cacher-ng/apt-cacher.log

COPY acng_override.conf  /etc/apt-cacher-ng/acng_override.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3142

VOLUME /var/cache/apt-cacher-ng

CMD [ "/docker-entrypoint.sh" ]
