#!/bin/bash


VAULT_PASS="netology"


docker run -d --name rocky9 rockylinux:9 sleep infinity
docker run -d --name ubuntu ubuntu:latest sleep infinity
docker run -d --name fedora fedora:latest sleep infinity

docker exec rocky9 dnf install -y python3
docker exec ubuntu apt-get update && docker exec ubuntu apt-get install -y python3
docker exec fedora dnf install -y python3

ansible-playbook -i inventory/prod.yml site.yml --vault-password-file <(echo "$VAULT_PASS")

docker stop rocky9 ubuntu fedora
