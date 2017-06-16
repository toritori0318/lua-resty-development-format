FROM openresty/openresty:trusty

RUN mkdir -p /var/cache/nginx/proxy_cache

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update && \
      apt-get install -y curl vim-tiny wget --no-install-recommends && \
      apt-get install -y libuuid1 --no-install-recommends && \
      apt-get install -y libnettle4 --no-install-recommends && \
      apt-get install -y ca-certificates && \
      apt-get clean && \
      rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# ln
RUN ln -s /usr/local/openresty /opt/openresty

## luarocks
#RUN /opt/openresty/luajit/bin/luarocks install inspect
#RUN /opt/openresty/luajit/bin/luarocks install net-url
#RUN /opt/openresty/luajit/bin/luarocks install luasocket
#RUN /opt/openresty/luajit/bin/luarocks install lua-resty-http
#RUN /opt/openresty/luajit/bin/luarocks install lua-messagepack

## other modules
## lua-resty-uuid
#RUN mkdir -p /opt/openresty/nginx/shared/lua/resty && \
#    wget --no-check-certificate https://raw.githubusercontent.com/bungle/lua-resty-uuid/master/lib/resty/uuid.lua -O /opt/openresty/nginx/shared/lua/resty/uuid.lua

ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

WORKDIR /usr/local/openresty/nginx

EXPOSE 80
