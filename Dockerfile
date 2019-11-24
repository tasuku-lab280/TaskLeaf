FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client vim

RUN mkdir /taskleaf
WORKDIR /taskleaf
ADD Gemfile /taskleaf/Gemfile
ADD Gemfile.lock /taskleaf/Gemfile.lock
RUN bundle install
COPY . /taskleaf

CMD ["rails", "server", "-b", "0.0.0.0"]