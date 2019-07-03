#!/bin/bash

DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  apt-get -y upgrade \
  unattended-upgrade -v \
  apt install unzip make vim tmux wget curl software-properties-common python-minimal python3-pip -y
