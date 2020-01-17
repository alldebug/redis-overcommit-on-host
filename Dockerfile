FROM alpine:latest
VOLUME /mnt

CMD echo 1 > /mnt/vm/overcommit_memory
CMD echo never > /sys/kernel/mm/transparent_hugepage/enabled
