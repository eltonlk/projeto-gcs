# Leverage the official Ruby image from Docker Hub
# https://hub.docker.com/_/ruby
FROM ruby:2.7.2

# Install dependencies
RUN apt-get update && apt-get install -y apt-utils tzdata

# Set local timezone
RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Install PostgreSQL client (needed for the connection to Google CloudSQL instance)
RUN apt-get install -y postgresql-client

# Install recent versions of nodejs (lts) and yarn pkg manager
# Needed to properly pre-compile Rails assets
RUN (curl -sL https://deb.nodesource.com/setup_lts.x | bash -) && apt-get update && apt-get install -y nodejs

RUN (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Copy application code to the container image. Note: files listed in .gitignore are not copied (e.g.secret files)
ENV APP_FOLDER=/usr/src/app
RUN mkdir $APP_FOLDER
WORKDIR $APP_FOLDER

# Copy the main application.
COPY . $APP_FOLDER

# Install dependencies (Gems installation in local vendor directory)
RUN gem install bundler
RUN bundle config set deployment 'true'
RUN bundle install --without="development test"
RUN yarn install --check-files

# For now we don't have a Nginx/Apache frontend so tell the Puma HTTP server to serve static content (e.g. CSS and Javascript files)
ENV RAILS_SERVE_STATIC_FILES=true

# Redirect Rails log to STDOUT for Cloud Run to capture
ENV RAILS_LOG_TO_STDOUT=true

# Expose port to the Docker host, so we can access it from the outside.
ENV PORT 3000

# Designate the initial sript to run on container startup
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
