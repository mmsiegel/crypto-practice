FROM centos:7

MAINTAINER "mmsiegel"

LABEL Remarks="Dockerfile for Centos 7 Litecoind"

RUN mkdir /litecoin
WORKDIR /litecoin

#Litecoin Version
ARG LTC_VER=0.18.1

#Makes the user, installs tools, and updates
RUN useradd -r litecoin && \
  yum -y update && \
  yum -y install curl gpg gnupg && \
  yum clean all

#Downloads the litecoin bundle and verifies the checksum
#Sourced from https://github.com/uphold/docker-litecoin-core/blob/master/0.18/Dockerfile#L34
RUN curl -SLO https://download.litecoin.org/litecoin-${LTC_VER}/linux/litecoin-${LTC_VER}-x86_64-linux-gnu.tar.gz \
  && curl -SLO https://download.litecoin.org/litecoin-${LTC_VER}/linux/litecoin-${LTC_VER}-linux-signatures.asc \
  && gpg --keyserver pgp.mit.edu --recv-key FE3348877809386C \
  && gpg --verify litecoin-${LTC_VER}-linux-signatures.asc \
  && grep $(sha256sum litecoin-${LTC_VER}-x86_64-linux-gnu.tar.gz | awk '{ print $1 }') litecoin-${LTC_VER}-linux-signatures.asc \
  && tar --strip=2 -xzf *.tar.gz -C /usr/local/bin \
  && rm *.tar.gz

VOLUME ["/home/litecoin/.litecoin"]

#Port, RPC, Test Port, Test RPC
#Sourced from https://github.com/blocknetdx/dockerimages/blob/master/ltc/Dockerfile#L64
EXPOSE 9332 9333 19332 19333

CMD ["litecoind"]