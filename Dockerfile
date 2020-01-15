FROM alpine:latest
VOLUME /mnt

CMD echo 1 > /mnt/vm/overcommit_memory
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
