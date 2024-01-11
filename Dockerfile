FROM ubuntu:24.04

MAINTAINER Patric Eckhart <mail@patriceckhart.com>

RUN apt-get update
RUN apt-get install openssh-client -y
RUN apt-get install openssh-server -y
RUN apt-get install nano -y
RUN man sshd_config

EXPOSE 22

WORKDIR /home

COPY /root-files/ /root-files/
RUN chown -R root:root /root-files && chmod -R 775 /root-files && chown -R root:root /home && chmod -R 775 /home

ENTRYPOINT ["/root-files/init.sh"]