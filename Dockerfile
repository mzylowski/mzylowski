FROM ubuntu:18.04 as latex

#Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install texlive-latex-extra texlive-fonts-extra && apt-get clean

COPY cv /cv

WORKDIR /cv

RUN pdflatex cv.tex
