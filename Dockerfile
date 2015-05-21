FROM mono:latest
RUN apt-get update -y && apt-get install wget -y \
    wget http://www.linuxdot.net/down/jexus-5.6.4.tar.gz \
    tar -zxf jexus-5.6.4.tar.gz \
    cd jexus-5.6.4 \
    ./install \
    /usr/jexus/jws start
ADD ./src /var/www/default
EXPOSE 80
ENTRYPOINT ["/usr/jexus/jws", "start"]
