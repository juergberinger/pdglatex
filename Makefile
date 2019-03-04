# pdglatex Makefile

run:
	@docker run -it pdglatex

build:
	@docker build -t pdglatex .
	@docker image ls pdglatex
