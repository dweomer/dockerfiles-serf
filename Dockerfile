FROM dweomer/hashibase as hashibase

WORKDIR /tmp

ARG SERF_VERSION=0.8.1

ADD https://releases.hashicorp.com/serf/${SERF_VERSION}/serf_${SERF_VERSION}_SHA256SUMS .
ADD https://releases.hashicorp.com/serf/${SERF_VERSION}/serf_${SERF_VERSION}_SHA256SUMS.sig .
ADD https://releases.hashicorp.com/serf/${SERF_VERSION}/serf_${SERF_VERSION}_linux_amd64.zip .

RUN gpg --verify serf_${SERF_VERSION}_SHA256SUMS.sig serf_${SERF_VERSION}_SHA256SUMS
RUN grep linux_amd64.zip serf_${SERF_VERSION}_SHA256SUMS | sha256sum -cs
RUN unzip serf_${SERF_VERSION}_linux_amd64.zip -d /usr/local/bin

FROM alpine

ARG SERF_GID=1337
ARG SERF_UID=7337

RUN set -x \
 && apk add --no-cache \
    dumb-init \
    su-exec \
 && addgroup -g ${SERF_GID} serf \
 && adduser -S -G serf -u ${SERF_UID} serf
COPY --from=hashibase /usr/local/bin/* /usr/local/bin/

USER serf
ENTRYPOINT ["serf"]
CMD ["help"]
