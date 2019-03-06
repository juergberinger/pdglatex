# pdglatex
Docker image with PDG LaTeX installation (for PDG review authors).

## Overview

This Docker image contains an installation of TeXLive 2018 with all the packages needed to run LaTeX on PDG review articles.

To use it, you need to install Docker on your computer. See the instructions at [https://docs.docker.com/install/](https://docs.docker.com/install/) on how to do this.

## Usage

After installing Docker, get the latest version of this image from Docker Hub:
```bash
docker pull juergberinger/pdglatex
```

You may also want to [download](https://raw.githubusercontent.com/juergberinger/pdglatex/master/pdgmake.sh)  the `pdgmake.sh` utility script and place it into the directory where you've checked out your review (or put it in a directory listed in your `PATH`).

In the directory where you've checked out your review, you can then run LaTeX using
```bash
./pdgmake.sh
```
This will produce the draft version of the review. If you want to make e.g. the book version, use
```bash
./pdgmake.sh book
```

Alternatively you can run the Docker image directly as follows:
```bash
docker run --rm -it -u `id -u`:`id -g` -v ${PWD}:${PWD} -w ${PWD} juergberinger/pdglatex
```
At the resulting `bash` shell prompt, you can manually run either `make`  or `pdflatex/bibtex`, following the instructions in PdgWorkspace on how to run LaTeX for PDG reviews.

## Notes

- You can use this container to check out your review source files with SVN. Run the image as given above, and at the resulting `bash` shell prompt enter the `svn` command given in PdgWorkspace to checkout your review source files.

- To run LaTeX on a PDG review, the name of the parent directory must be the BASENAME of the corresponding review. That's why it is important to run the container with the option `-v ${PWD}:${PWD}` to ensure that the directory name inside the container is the same as when running directly on your computer.

- To view the produced PDF file, use your regular PDF viewer. The image does not have a PDF viewer installed.