FROM ruby:2.2.7

RUN curl -sL https://deb.nodesource.com/setup_6.x |  bash - \
  && apt-get install -y nodejs postgresql-client

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app/
