FROM ruby:3.1.2
ARG ROOT="/karoyaka"
ENV TZ=Asia/Tokyo

WORKDIR ${ROOT}

# 必須ではないパッケージも一緒にインストールされないようにオプション付与
# MariaDB: mysqlから派生。高性能。
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                  mariadb-client tzdata libvips

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}
RUN gem install bundler
RUN bundle install --jobs 4

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]