FROM ubuntu:bionic-20200311
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -qq --no-install-recommends install cgroup-bin sudo gcc-multilib xinetd firejail vim && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /pwnpeii/scripts /pwnpeii/challenge-files
WORKDIR /pwnpeii

COPY scripts/cleanup.sh /pwnpeii/scripts
COPY scripts/runner.sh /pwnpeii/scripts

COPY configs/limits.conf /etc/security/limits.conf
COPY configs/sysctl.conf /etc/sysctl.conf

RUN groupadd problemusers
RUN useradd -m -G problemusers problemuser

COPY start.sh /pwnpeii/start.sh

ENTRYPOINT "/pwnpeii/start.sh"

EXPOSE 6000
