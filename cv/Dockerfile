FROM ubuntu:18.04 as latex_deps

#Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install texlive-latex-extra texlive-lang-polish texlive-fonts-extra apache2 poppler-utils && apt-get clean

#Copy sources
RUN mkdir -p /var/www/html/cv
WORKDIR /var/www/html/cv

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
