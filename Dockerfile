FROM ruby:3.1.1

WORKDIR /www/service

RUN apt-get update -qq \
    && apt-get install -y curl build-essential apt-transport-https libpq-dev locales wget \
    && apt-get clean

RUN echo "America/Sao_Paulo" > /etc/timezone && \
  dpkg-reconfigure -f noninteractive tzdata && \
  sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen && \
  echo 'LANG="pt_BR.UTF-8"'>/etc/default/locale && \
  echo 'LC_ALL="pt_BR.UTF-8"'>/etc/default/locale && \
  echo 'LANGUAGE="pt_BR.UTF-8"'>/etc/default/locale && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=pt_BR.UTF-8

ENV LC_ALL=pt_BR.UTF-8
ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR.UTF-8
ENV TZ America/Sao_Paulo
ENV TIME_ZONE Brasilia

COPY Gemfile /www/service/Gemfile
COPY Gemfile.lock /www/service/Gemfile.lock

COPY . /www/service/

RUN bundle install --verbose --jobs 10 --retry 3 