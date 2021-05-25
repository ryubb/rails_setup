FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install -g yarn
RUN mkdir /rails_app
WORKDIR /rails_app

COPY Gemfile /rails_app/Gemfile
COPY Gemfile.lock /rails_app/Gemfile.lock
RUN bundle install --without production
COPY . /rails_app

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]