FROM ubuntu:18.04 as build

ARG branch=master

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    tclsh \
    pkg-config \
    cmake \
    libssl-dev \
    build-essential \
    git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# note: should be avoid the cache using branch arg
RUN git clone -b ${branch} --depth 1 https://github.com/Haivision/srt.git /opt/srt

WORKDIR /opt/srt

RUN ./configure --prefix=/opt/local && make && make install

FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    libssl-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY --from=build /opt /opt

WORKDIR /opt/srt

ENV PATH $PATH:/opt/local/bin
