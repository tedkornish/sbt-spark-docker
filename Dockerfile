FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y gnupg2 curl && \
  echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
  curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && \
  apt-get update && \
  apt-get install -y scala openjdk-8-jdk wget sbt && \
  wget http://apache.claz.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz && tar xvzf spark-2.4.5-bin-hadoop2.7.tgz && \
  ./spark-2.4.5-bin-hadoop2.7/sbin/start-master.sh
