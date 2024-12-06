FROM debian:bullseye
RUN apt update && apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install procps -y
COPY conf/my.cnf /etc/my.cnf
COPY tools/script.sh /
CMD ["/bin/sh", "./script.sh"]
