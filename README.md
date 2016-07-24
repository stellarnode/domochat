# README

To run this application, remember to do the following (instructions given for Mac OS):

* Install Redis: `brew install redis`

* Run Redis server: `/usr/local/bin/redis-server` (in a separate terminal window)

* Launch Sidekiq for async jobs in a separate terminal window: `bundle exec sidekiq`

* Launch Faye service in a separate terminal window: `rackup sync.ru -E production`

* Launch Crono service in a separate terminal window in your Rails project root directory: `crono` (or `bundle exec crono`)

* In a separate terminal window start Rails server: `rails s`


Also, you have to have PostgresQL installed and running (use PostgresApp and PGAdmin apps). The database configuration is located in `config/database.yml`. Here is an example of the `:development` config lines for PostgresQL:

```
development:
  <<: *default
  database: dc
  username: <your_user_name>
  password: <your_password>
  host: <%= ENV['IP'] %>
```
In case of SSL certificate problem during your authentication thru Facebook look for solution here: 'https://gist.github.com/fnichol/867550'.
