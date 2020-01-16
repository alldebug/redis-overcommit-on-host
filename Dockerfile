FROM alpine:latest
VOLUME /mnt

CMD echo 1 > /mnt/vm/overcommit_memory
CMD ["redis-server", "--include /usr/local/etc/redis/redis.conf"]
