FROM wordpress:latest

MAINTAINER sachindras@spc.int

COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini

RUN apt-get update -y && apt-get install -y vim nano curl wget && apt-get clean -y

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
#COPY wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

RUN mkdir /spc
COPY extra.zip /spc/extra.zip
COPY divi.zip /spc/divi.zip
COPY divi-builder.zip /spc/divi-builder.zip

EXPOSE 80

