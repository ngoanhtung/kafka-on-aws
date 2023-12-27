# Dockerfile-kafka
FROM openjdk:8-jre-alpine

ENV KAFKA_VERSION 3.6.1
ENV KAFKA_HOME /opt/kafka
ENV PATH ${PATH}:${KAFKA_HOME}/bin

RUN apk add --no-cache wget bash \
    && mkdir -p /opt \
    && wget -q https://downloads.apache.org/kafka/$KAFKA_VERSION/kafka_2.13-$KAFKA_VERSION.tgz \
    && tar -xzf kafka_2.13-$KAFKA_VERSION.tgz -C /opt \
    && mv /opt/kafka_2.13-$KAFKA_VERSION $KAFKA_HOME \
    && addgroup -S kafka && adduser -S kafka -G kafka \
    && chown -R kafka:kafka $KAFKA_HOME

RUN chmod -R a+rwx /opt/kafka
COPY kafka/start-kafka.sh $KAFKA_HOME/start-kafka.sh
RUN chmod a+x $KAFKA_HOME/start-kafka.sh

WORKDIR $KAFKA_HOME
CMD ./start-kafka.sh