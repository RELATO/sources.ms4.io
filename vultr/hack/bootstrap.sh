#!/bin/bash
set -eu

sleep 30

yum -y update
yum -y install iscsi-initiator-utils

systemctl disable firewalld.service
systemctl stop firewalld

curl https://releases.rancher.com/install-docker/18.06.sh | sh
