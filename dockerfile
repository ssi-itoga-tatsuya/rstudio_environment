FROM rocker/rstudio:4.2.0

RUN apt update
RUN apt install vim -y
RUN apt install less -y
RUN apt install libxml2-dev -y
RUN apt install zlib1g-dev -y
RUN apt install libpng-dev -y
RUN apt install libbz2-dev -y
RUN apt install liblzma-dev -y
RUN apt install libgsl-dev -y

WORKDIR /home/rstudio
RUN mkdir -p R/library
RUN chown -R rstudio:rstudio R

COPY rsession.conf /etc/rstudio

COPY install_packages.R /tmp/
WORKDIR /tmp
RUN Rscript install_packages.R