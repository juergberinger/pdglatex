# pdglatex Makefile

build:
	@docker build -t pdglatex .
	@docker image ls pdglatex

run:
	@docker run --rm -it -u $(shell id -u):$(shell id -g) -v ${PWD}:${PWD} -w ${PWD} pdglatex

rundev:
	@docker pull juergberinger/pdglatex:dev
	@docker run --rm -it -u $(shell id -u):$(shell id -g) -v ${PWD}:${PWD} -w ${PWD} juergberinger/pdglatex:dev

restart:
	@sudo systemctl restart docker
