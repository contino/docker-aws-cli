FROM alpine:3.6

ENV AWS_CLI_VERSION=1.15.51

RUN apk -v --no-cache --update add \
        python \
        py-pip \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        curl \
        zip \
        git \
        && \
    pip install --no-cache-dir --upgrade awscli==$AWS_CLI_VERSION && \
    update-ca-certificates && \
    apk -v --purge del py-pip
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk -v --no-cache --update add py-jmespath 

VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]