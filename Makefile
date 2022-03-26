build:
	docker build -t initcontainer .

run: dirs
	docker run -v ./data/conf:/config -v ./data/plug/:/plugins -e INIT_TYPE=proxy initcontainer

dirs:
	mkdir -p ./data/{conf,plug,}
