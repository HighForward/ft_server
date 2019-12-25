FROM	debian:buster

COPY    srcs/wordpress.tar.gz /home/
COPY    srcs/wordpress.sql /home/
COPY	srcs/database /home/
ADD		srcs/wordpress.conf /etc/nginx/sites-available/wordpress.conf
ADD		srcs/installation.sh init.sh

RUN		bash init.sh

CMD		service mysql restart && \
		service php7.3-fpm start && \
		nginx -g 'daemon off;'

EXPOSE	80
