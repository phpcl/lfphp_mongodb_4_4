#
# MongoDB Installation Container
# Use this container to safely test your skills installing MongoDB
#

# Pull base image from "official" ubuntu latest version (currently 20.04 == focal)
FROM ubuntu:latest

# Install pre-requisites for MongoDB installation
RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install vim && \
    apt-get -y install inetutils-ping && \
    apt-get -y install net-tools && \
    apt-get -y install wget && \
    apt-get -y install gnupg && \
    apt-get -y install systemd
