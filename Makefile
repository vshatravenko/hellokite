VERSION := $(shell cat VERSION)
IMAGE   := gcr.io/helios-devel/hellokite:$(VERSION)

default: build run

build:
	@echo '> Building "hellokite" docker image...'
	@docker build -t $(IMAGE) .

push:

	gcloud docker -- push $(IMAGE)


run:
	@echo '> Starting "hellokite" container...'
	@docker run -d $(IMAGE)

ci:
	@fly -t hci set-pipeline -p hellokite-helm -c .kite/pipelines/review.yml -n
	@fly -t hci unpause-pipeline -p hellokite-helm

deploy:
	@helm install .kite/charts/hellokite --set "image.tag=$(VERSION)"
