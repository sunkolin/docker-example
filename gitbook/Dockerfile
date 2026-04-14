FROM centos:7.8.2003

MAINTAINER 2019-04-03 sunkolin sunkolin@qq.com

# 设置时区
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

# ls -l
RUN alias ll="ls -al"

# 创建目录
RUN mkdir -p /opt/workspace/

# 安装软件
RUN yum install wget -y
RUN yum install gcc -y
RUN yum install net-tools -y
RUN yum install telnet.x86_64 -y
RUN yum install xinetd.x86_64 -y

# java
#WORKDIR /opt
#RUN curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"
#RUN tar zxvf jdk-8u191-linux-x64.tar.gz && rm -f jdk-8u191-linux-x64.tar.gz && ln -s jdk1.8.0_191 java
#ENV JAVA_HOME=/opt/java
#ENV PATH=${PATH}:/opt/java/bin
#RUN echo "JAVA_HOME=$JAVA_HOME" && echo "PATH=$PATH" &&  ls -l /opt

# arthas
#WORKDIR /opt/arthas/
#RUN curl -O https://alibaba.github.io/arthas/arthas-boot.jar

# node npm gitbook
WORKDIR /tmp
RUN curl -O https://nodejs.org/dist/v10.22.1/node-v10.22.1-linux-x64.tar.gz &&\
    mkdir -p /opt/node &&\
    tar -xzvf /tmp/node-v10.22.1-linux-x64.tar.gz &&\
    mv /tmp/node-v10.22.1-linux-x64 /tmp/node &&\
    mv /tmp/node /opt &&\
    ln -s /opt/node/bin/* /usr/local/bin/ &&\
    echo "node -v = "`node -v` &&\
    echo "npm -v = " `npm -v` &&\
    npm install gitbook-cli -g &&\
    ln -s /opt/node/bin/gitbook /usr/local/bin/ &&\

    echo "gitbook -v = " `gitbook -V`

ADD . /opt/gitbook-example
RUN gitbook install ./

WORKDIR /opt/gitbook-example

# 启动
CMD gitbook serve --port 4000