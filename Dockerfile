FROM debian:buster

COPY srcs/setup.sh /home/

RUN bash /home/setup.sh

EXPOSE 80