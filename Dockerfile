FROM ruby:2.7.6
 
RUN apt-get update -qq \
  && apt-get install -y nodejs npm \
  && rm -rf /var/lib/apt/lists/* \
  && npm install --global yarn
 
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
