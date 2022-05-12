FROM rocker/rstudio:4.1.3

RUN apt update
RUN apt install -y vim
RUN apt install -y less
RUN apt install -y libxml2-dev
RUN apt install -y zlib1g-dev
RUN apt install -y libpng-dev
RUN apt install -y libbz2-dev
RUN apt install -y liblzma-dev
RUN apt install -y libgsl-dev
RUN apt install -y libglpk-dev

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
RUN apt install -y fonts-ipaexfont fonts-noto-cjk

WORKDIR /home/rstudio
EXPOSE 8787

COPY rsession.conf /etc/rstudio

RUN mkdir -p R/library
RUN chown -R rstudio:rstudio R

COPY install_packages.R /tmp/
WORKDIR /tmp
RUN Rscript --verbose install_packages.R
