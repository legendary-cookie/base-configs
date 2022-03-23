#!/bin/sh
rawUrl="https://legendary-cookie.github.io/base-configs"
if [ "$INIT_TYPE" = "proxy" ]; then
    curl -fsSL -o /config/velocity.toml "${rawUrl}/velocity.toml"
    mkdir -p /plugins/Kuvel
    curl -fsSL -o /plugins/Kuvel/config.yml "${rawUrl}/kuvel-conf.yml"
else
    curl -fsSL -o /config/paper.yml "${rawUrl}/paper.yml"
    curl -fsSL -o /config/spigot.yml "${rawUrl}/spigot.yml"
fi
