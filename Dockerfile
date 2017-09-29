FROM ruby:2.2.7

RUN curl -sL https://deb.nodesource.com/setup_6.x |  bash - \
  && apt-get install -y nodejs postgresql-client

RUN groupadd -r safecast && useradd -r -g safecast safecast

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app/
RUN chown -R safecast:safecast /app

USER safecast
