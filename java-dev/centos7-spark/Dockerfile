FROM willb/java-dev:centos7

RUN git clone https://github.com/apache/spark /tmp/spark
RUN (cd /tmp/spark && sbt update)
RUN rm -rf /tmp/spark

ENTRYPOINT /bin/zsh