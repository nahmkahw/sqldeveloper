FROM    oraclelinux:6
MAINTAINER nahmkahw <nahmkahw@gmail.com>
RUN echo "Asia/Bangkok" > /etc/timezone
RUN groupadd -g 54321 oinstall
RUN groupadd -g 54322 dba
RUN useradd -m -g oinstall -G oinstall,dba -u 54321 oracle
RUN yum -y install xterm xauth libXtst
ADD oracle-install-files/jdk-8u144-linux-x64.rpm /tmp/
RUN yum -y install /tmp/jdk-8u144-linux-x64.rpm
RUN rm -f /tmp/jdk-8u144-linux-x64.rpm
ADD oracle-install-files/sqldeveloper-17.2.0.188.1159-1.noarch.rpm /tmp/
RUN yum -y install /tmp/sqldeveloper-17.2.0.188.1159-1.noarch.rpm
RUN rm /tmp/sqldeveloper-17.2.0.188.1159-1.noarch.rpm
USER oracle
WORKDIR /home/oracle
ENV JAVA_HOME=/usr/java/latest
CMD sqldeveloper
