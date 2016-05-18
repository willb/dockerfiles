FROM centos:centos7

RUN yum install -y java java-devel git emacs zsh curl 

## taken from jupyter dockerfile

# Not essential, but wise to set the lang
# Note: Users with other languages should set this in their derivative image
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8

# Python binary and source dependencies
RUN yum install -y curl \
    	gnupg2 \
    	gcc \
	gcc-c++ \
	openssl-devel \		
	glibc-devel \
        git \
        language-pack-en \
        libcurl4-openssl-dev \
        libffi-devel \
        libsqlite3-devel \
        libzmq3-devel \
        pandoc \
        python \
        python-devel \
        sqlite3 \
        texlive-fonts-recommended \
        texlive-latex-base \
        texlive-latex-extra \
        zlib1g-devel

# Install the recent pip release
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python2 get-pip.py && \
    rm get-pip.py && \
    pip2 --no-cache-dir install requests[security] && \
    rm -rf /root/.cache

# Install some dependencies.
RUN pip2 --no-cache-dir install ipykernel && \
    python2 -m ipykernel.kernelspec && \
    rm -rf /root/.cache

# Move notebook contents into place.
ADD . /usr/src/jupyter-notebook

RUN yum install -y epel-release

# Install dependencies and run tests.
RUN BUILD_DEPS="nodejs npm" && \
    yum install -y $BUILD_DEPS && \
    \
    pip2 install --no-cache-dir widgetsnbextension && \
    \
    npm cache clean && \
    rm -rf /root/.npm && \
    rm -rf /root/.cache && \
    rm -rf /root/.config && \
    rm -rf /root/.local && \
    rm -rf /root/tmp

# Add a notebook profile.
RUN mkdir -p -m 700 /root/.jupyter/ && \
    echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py

VOLUME /notebooks
WORKDIR /notebooks

# sbt setup

RUN curl -s https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > /bin/sbt
RUN chmod 0755 /bin/sbt
RUN yum install -y maven ivy

# tini setup

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 && gpg --verify /tini.asc
RUN chmod +x /tini

ENTRYPOINT ["/tini", "--"]

EXPOSE 8888

CMD ["jupyter", "notebook", "--browser=echo"]