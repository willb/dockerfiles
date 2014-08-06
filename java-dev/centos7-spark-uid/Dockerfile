FROM willb/java-dev:centos7-spark

RUN cd /root && cp -rv . /etc/skel
RUN cd /root && rm -rf .sbt .ivy .m2
RUN ["useradd", "-u", "1234", "-s", "/bin/zsh", "dockerdev"]
RUN chown -R 1234:1234 $(cat /etc/passwd | grep dockerdev | cut -f6 -d:)

COPY boot.sh /boot.sh
RUN chmod 755 /boot.sh

ENTRYPOINT /boot.sh