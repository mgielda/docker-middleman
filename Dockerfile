#
# Ruby Dockerfile
#
# https://github.com/dockerfile/ruby
#

# Pull base image.
FROM ubuntu:16.04

COPY Gemfile /home

# Install Ruby.
RUN \
  apt-get update && \
  apt-get install -y git openssl make gcc g++ zlib1g-dev ruby rake ruby-dev ruby-bundler libruby2.3 && \
  rm -rf /var/lib/apt/lists/*

RUN cd /home && bundle install

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
