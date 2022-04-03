# Copyright (c) 2022 Robert Lehmann

# Dockerfile for running musl based cross compiler in an docker container
# Inspiration comes from https://github.com/JetBrains/clion-remote/blob/master/Dockerfile.remote-cuda-env

FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install tzdata keyboard-configuration

RUN apt-get update \
  && apt-get install -y ssh \
      build-essential \
      gcc \
      g++ \
      gdb \
      clang \
      make \
      ninja-build \
      cmake \
      autoconf \
      automake \
      locales-all \
      dos2unix \
      rsync \
      tar \
      curl \
  && apt-get clean

RUN mkdir /usr/local/musl

RUN curl -SLO https://musl.cc/arm-linux-musleabihf-cross.tgz && \
    tar -xzf arm-linux-musleabihf-cross.tgz -C /usr/local/musl && \
    rm -rf arm-linux-musleabihf-cross.tgz

ADD toolchain-musl.cmake /usr/local/musl

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_musl_cross \
  && mkdir /run/sshd

RUN useradd -m user \
  && yes password | passwd user

RUN usermod -s /bin/bash user && \
    echo "PATH=$PATH:/usr/local/musl/arm-linux-musleabihf-cross/bin" >> /home/user/.bashrc


EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_musl_cross"]