<h1 align="center">
  Task Management System (CVWO)
</h1>

<img src="https://i.imgur.com/4Qbw8AA.png"/>

<h3 align="center"><i>Task Management System API server in Ruby on Rails (not my best!)</i></h3>


## Requirements

* Ruby 2.7.0

* Rails 6.1.4.x

* This is developed with PostgreSQL as the database backend, therefore PostgresSQL is recommended. The instructions below assumes that you will be using PostgreSQL.

## Setting up the development server

Installation is assumed to be done on a fresh copy of Ubuntu with PostgreSQL.

First, install the dependencies.

```bash
sudo apt-get install postgresql build-essential bison openssl curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev autoconf libc6-dev ncurses-dev automake libtool libpq-dev
```

Then, install the Gem depencencies.

```bash
bundle install
```

Configure PostgreSQL, `config/database.yml` (example given in the config directory), `db/seeds.rb` (for the credentials of the default admin user account) and `config/initializers/cors.rb`. You may need to regenerate the master key and credentials to be used with the server. Afterwards, initialise the database.

```bash
rails db:create db:migrate db:seed
```

Finally, run the server for development.

```bash
rails server -p 3001
```

## Areas for improvement

1) Write unit tests. I was short on time and did not learn how to write unit tests for Rails.

2) Docker deployment.

3) Implement `Redis` for caching.

4) Use `.ENV` for configurations instead.
