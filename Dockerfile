FROM ubuntu:18.04 as latex

#Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install texlive-latex-extra texlive-lang-polish texlive-fonts-extra && apt-get clean

#Build project
COPY cv /cv
WORKDIR /cv

RUN pdflatex cv.tex

#Prepare container for hosting CV
FROM httpd:2.4 as hoster
COPY --from=latex /cv/cv.pdf /usr/local/apache2/htdocs
