# Dockerfile-zookeeper
FROM openjdk:8-jre-alpine

ENV ZOOKEEPER_VERSION 3.8.3
ENV ZOOKEEPER_HOME /opt/zookeeper


RUN apk add --no-cache wget bash 
RUN mkdir -p /opt 
RUN wget -q https://dlcdn.apache.org/zookeeper/zookeeper-$ZOOKEEPER_VERSION/apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz
RUN tar -xzf apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz -C /opt \
    && rm apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz
RUN mv /opt/apache-zookeeper-$ZOOKEEPER_VERSION-bin $ZOOKEEPER_HOME \
    && cp $ZOOKEEPER_HOME/conf/zoo_sample.cfg $ZOOKEEPER_HOME/conf/zoo.cfg

WORKDIR $ZOOKEEPER_HOME
EXPOSE 2181 2888 3888

CMD ["bin/zkServer.sh", "start-foreground"]