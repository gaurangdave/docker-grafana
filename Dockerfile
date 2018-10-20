FROM resin/rpi-raspbian:latest
ENTRYPOINT []

# TODO : run chmod for all 

# Create aarnam directory
WORKDIR /usr/src/aarnam

COPY ./start.sh ./
RUN chmod 755 ./start.sh

RUN  sudo apt-get update && \
     apt-get install wget && \
     wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.3.1.linux-armv7.tar.gz && \
     tar -zxvf grafana-5.3.1.linux-armv7.tar.gz

EXPOSE 3000

CMD ["sh", "./start.sh"]