FROM ubuntu:18.04 as latex

#Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install texlive-latex-extra texlive-lang-polish texlive-fonts-extra apache2 && apt-get clean

#Copy sources
COPY . /var/www/html
WORKDIR /var/www/html

#Build project for the first time
RUN cd cv && pdflatex cv.tex
WORKDIR cv

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
