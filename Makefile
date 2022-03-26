NAME=initcontainer
REGISTRY=registry.pawott.de
VERSION=1.0.1

build:
	docker build -t $(NAME):latest .

tag: build
	docker tag $(NAME):latest $(REGISTRY)/$(NAME):latest $(REGISTRY)/$(NAME):$(VERSION)

push: tag
	docker push $(REGISTRY)/$(NAME):latest
	docker push $(REGISTRY)/$(NAME):$(VERSION)

run: dirs
	docker run -v ./data/conf:/config -v ./data/plug/:/plugins -e INIT_TYPE=proxy $(NAME)

dirs:
	mkdir -p ./data/{conf,plug,}
