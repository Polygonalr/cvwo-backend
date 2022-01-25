# CVWO backend

Task Management System API server in Ruby on Rails

## Requirements

* Ruby 2.7.0

* Rails 6.1.4.1

* This is developed with postgres as the database backend, therefore postgres is recommended too.

## Dev server

Installation is assumed to be done on a fresh copy of Ubuntu with PostgreSQL.

* `sudo apt-get install postgresql build-essential bison openssl curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev autoconf libc6-dev ncurses-dev automake libtool libpq-dev`

* `bundle install`

* Configure PostgreSQL, `config/database.yml` (example given in the config directory), `db/seeds.rb` (for the credentials of the default admin user account) and `config/initializers/cors.rb`. You may need to regenerate the master key and credentials to be used with the server.

* `rails db:create db:migrate db:seed`

* `rails server -p 3001`

## To do

* Write unit tests. I was short on time and did not learn how to write unit tests for Rails.

* Docker deployment.

* Implement Redis for caching.

* Use .ENV for configurations instead.

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
