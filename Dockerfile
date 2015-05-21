FROM mono:latest
RUN apt-get -qq update && apt-get -qqy install wget -y
RUN mkdir /jexus \
    && cd /jexus \
    && wget http://www.linuxdot.net/down/jexus-5.6.4.tar.gz \
    && tar -zxf jexus-5.6.4.tar.gz \
    && cd jexus-5.6.4 \
    && ./install \
    && rm -rf jexus
ADD ./src /var/www/default
EXPOSE 80
ENTRYPOINT /usr/jexus/jws start && tail -f /usr/jexus/log/jws.log
