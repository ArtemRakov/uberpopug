FROM ruby:2.7.2

RUN apt-get update \
      && apt-get install -y build-essential libpq-dev libsqlite3-dev

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn

RUN npm install -g npm-check-updates

ENV BUNDLE_PATH /code/uberpopug/vendor/bundle

WORKDIR /code/uberpopug
