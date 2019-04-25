#!/bin/bash
set -eu

sleep 30

apt update
apt -y install open-iscsi
curl https://releases.rancher.com/install-docker/18.06.sh | sh
