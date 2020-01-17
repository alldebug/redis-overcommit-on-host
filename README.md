# redis-overcommit-on-host

Enable overcommitting to memory on a host running a redis container.  See the [Redis documentation](https://redis.io/topics/faq#background-saving-fails-with-a-fork-error-under-linux-even-if-i-have-a-lot-of-free-ram) for more information.

# How to use
Schedule this container to run alongside any host with a running `redis` container.


##### Docker Compose
```yml
version: "3.5"
volumes:
  redis-data:
services:
  redis-overcommit:
    build: https://github.com/alldebug/redis-overcommit-on-host.git
    restart: "no"
    privileged: true
    volumes:
      - /proc/sys/vm:/mnt/vm


  redis:
    image: redis:alpine
    restart: always
    command: ["redis-server", "--appendonly", "yes"]
    command: ["redis-server","--maxmemory","256mb"]
    command: ["redis-server","--maxmemory-policy","allkeys-lru"]
    command: ["redis-server","--include","/usr/local/etc/redis/redis.conf"]
    
    volumes:
      - redis-data:/usr/local/etc/redis
    ports:
      - 6379:6379
    depends_on:
      - redis-overcommit
```

 
### Why do this in a container?

I'm a big fan of a container's ability to serve as documentation for any special changes that need to happen on the host for a container to run right.  
