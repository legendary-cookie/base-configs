#!/bin/sh
function templ() {
	local inFile="$1"
	local outFile="$2"
        envsubst < $inFile | sed 's:^\s*#.*$::g' | awk 'NF' > $outFile
}

# velocity
export MOTD=${MOTD:-"&3A Velocity Server"}
# kuvel
export KUVEL_REDIS_ENABLED=${KUVEL_REDIS_ENABLED:-"false"}
export KUVEL_REDIS_HOST=${KUVEL_REDIS_HOST:-"localhost"}
export KUVEL_REDIS_GROUP=${KUVEL_REDIS_GROUP:-"prod"}
export KUVEL_REDIS_PORT=${KUVEL_REDIS_PORT:-"6380"}
export KUVEL_REDIS_USER=${KUVEL_REDIS_USER:-""}
export KUVEL_REDIS_PASS=${KUVEL_REDIS_PASS:-""}


mkdir -p /config /plugins

if [ "$INIT_TYPE" = "proxy" ]; then
        mkdir -p /plugins/Kuvel
	confDir="/src/configs/proxy"
	templ $confDir/velocity.toml /config/velocity.toml
	templ $confDir/kuvel-conf.yml /plugins/Kuvel/config.yml
else
	confDir="/src/configs/server"
	templ $confDir/paper.yml /config/paper.yml
	templ $confDir/spigot.yml /config/spigot.yml
fi
