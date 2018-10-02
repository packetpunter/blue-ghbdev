FROM blue-centos-base:latest
RUN yum -y install gcc make gcc-c++ bzip2
RUN wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz; tar -xzvf ruby-install-0.7.0.tar.gz; cd ruby-install-0.7.0/; make install
RUN ruby-install ruby
RUN gem install github-pages
ENV workdir /app/code
