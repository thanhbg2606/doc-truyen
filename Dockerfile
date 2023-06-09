ARG RUBY_VERSION=3.0.4

FROM ruby:$RUBY_VERSION-alpine AS builder

RUN apk --no-cache add \
  openssl-dev \
  alpine-sdk \
  mysql-client \
  mysql-dev \
  build-base

COPY Gemfile* .

RUN bundle install

FROM ruby:$RUBY_VERSION-alpine AS runner

RUN apk --no-cache add \
    nodejs \
    bash \
    tzdata \
    curl \
    mysql-client \
    mysql-dev \
    vim

WORKDIR /app

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

COPY . .

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
