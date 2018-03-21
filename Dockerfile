FROM debian:stretch

LABEL maintainer="0815chr1s"

RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get -y --force-yes install \
		apache2 \
		software-properties-common \
		supervisor 

RUN a2enmod rewrite
COPY conf/000-default.conf /etc/apache2/sites-available/000-default.conf

#COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY script/run.sh /run.sh
RUN chmod 755 /run.sh

#COPY conf/config /config


EXPOSE 80
CMD ["/run.sh"]