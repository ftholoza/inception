FROM debian:bullseye
RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt update && apt upgrade -y
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ftholoza.42.fr/UID=ftholoza"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d
RUN chown -R www-data:www-data /var/www/html
#RUN chown -R www-data:www-data /home/ftholoza/data
#RUN chmod -R 755 /home/ftholoza/data
CMD ["nginx", "-g", "daemon off;"]
