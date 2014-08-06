FROM centos:centos7

RUN yum install -y java java-devel git emacs zsh curl
RUN curl -s https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > /bin/sbt
RUN chmod 0755 /bin/sbt
RUN yum install -y maven ivy


ENTRYPOINT /bin/zsh