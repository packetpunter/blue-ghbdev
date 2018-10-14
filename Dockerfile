FROM ubuntu:latest
RUN apt-get -y update; apt-get -y upgrade; apt-get -y install git ruby-full ruby-dev build-essential
RUN gem install jekyll bundler
RUN mkdir -p /app
RUN apt-get -y install libxml2 zlibc zlib1g-dev zlib1g
RUN gem install github-pages bundler
ENV workdir /app
WORKDIR ${workdir}
COPY ./Gemfile /app
RUN ["bundle","install"]
ENTRYPOINT [ "bundle","exec","jekyll", "serve", "--host=0.0.0.0" ]