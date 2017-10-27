VERSION := $(shell cat VERSION)
IMAGE   := gcr.io/helios-devel/hellokite:$(VERSION)

default: build run

build:
	@echo '> Building "hellokite" docker image...'
	@docker build -t $(IMAGE) .

run:
	@echo '> Starting "hellokite" container...'
	@docker run -d $(IMAGE)

ci:
	@fly -t ci set-pipeline -p hellokite -c config/pipelines/review.yml --load-vars-from config/pipelines/secrets.yml -n
	@fly -t ci unpause-pipeline -p hellokite

deploy:
	@helm install ./config/charts/hellokite --set "image.tag=$(VERSION)"
