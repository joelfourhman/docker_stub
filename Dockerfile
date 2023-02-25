FROM ubuntu:latest

LABEL maintainer "joel.fourhman@gmail.com"

# Install dependencies for things & clean apt cache
RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive \
&& apt-get install -y --no-install-recommends \
    build-essential \
    libc6-dev \
    python3 \
    pip \
    make \
&& apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt

ARG HOST_UID=1000
RUN useradd -m $(HOST_UID) build
USER build
ENV USER="build"
ENV HOME="/home/build/"
WORKDIR $(HOME)/workspace

ENTRYPOINT [ "./build.sh" ]