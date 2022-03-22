#!/bin/sh
rawUrl="https://raw.githubusercontent.com/legendary-cookie/base-configs/main"
curl -fsSL -o /config/velocity.toml "${rawUrl}/velocity.toml"
mkdir -p /plugins/Kuvel
curl -fsSL -o /plugins/Kuvel/config.yml "${rawUrl}/kuvel-conf.yml"
