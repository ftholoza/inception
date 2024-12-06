FROM debian:buster


RUN apt update -y 

RUN touch /tmp/wp-debug.log
RUN chmod 777 /tmp/wp-debug.log
RUN apt install php-fpm php-mysql -y
RUN apt-get update && apt-get install -y redis-server
RUN service redis-server start

RUN apt install curl -y


COPY ./tools/script.sh /
COPY ./tools/wp-config.php /
RUN chmod 777 script.sh

CMD ["/bin/sh", "/script.sh" ]
