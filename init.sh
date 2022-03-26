#!/bin/sh
function templ() {
	local inFile="$1"
	local outFile="$2"
        envsubst < $inFile > $outFile
}

export MOTD=${MOTD:-"&3A Velocity Server"}

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
