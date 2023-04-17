ARG RUBY_VERSION=3.0.4

FROM ruby:RUBY_VERSION-alpine AS builder

RUN apk --no-cache add \
  build-base \
  alpine-sdk \
  mysql-dev \
  mysql-client \
  vim \

COPY Gemfile* .

RUN bundle install

FROM ruby:RUBY_VERSION-alpine AS runner

RUN apk --no-cache add \
    tzdata \
    nodejs \
    bash \
    curl \
    openssl

WORKDIR /app

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
