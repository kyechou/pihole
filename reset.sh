#!/bin/bash

set -x

mapfile -t containers < <(docker ps --filter name=pihole -q)
if [[ ${#containers[@]} -ne 0 ]]; then
    docker compose down --remove-orphans -v
fi

sudo rm -rf caddy etc-* tailscale tailscale_sock
