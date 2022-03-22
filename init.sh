#!/bin/sh
rawUrl="https://https://legendary-cookie.github.io/base-configs"
curl -fsSL -o /config/velocity.toml "${rawUrl}/velocity.toml"
mkdir -p /plugins/Kuvel
curl -fsSL -o /plugins/Kuvel/config.yml "${rawUrl}/kuvel-conf.yml"
