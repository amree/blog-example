FROM ruby:2.6.3

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    libpq-dev \
  && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get install -y nodejs \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install rails:6.1.4.4 bundler:2.3.4
COPY Gemfile* /app
COPY bundle_install.sh .
RUN --mount=type=secret,id=bundle_credentials ./bundle_install.sh

RUN npm install -g yarn
COPY package.json /app
COPY yarn.lock /app
RUN yarn install

ADD . /app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
