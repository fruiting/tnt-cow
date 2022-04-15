FROM tarantool/tarantool:2.10.0-beta1

COPY ./src /opt/tarantool

RUN mkdir -p /var/log/tarantool/ && \
   chown -R tarantool:tarantool /var/log/tarantool