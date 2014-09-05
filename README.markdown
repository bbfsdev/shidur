# Installing
* Use RVM, or anything else to install ruby >= 2.1
* create databases at least for dev and test use, for ex. shidur_dev and shidur_test
* add enviromnent variables like that to your startup file (eg ~/.bashrc or ~/.profile)
```bash
  export SHIDUR_DEV_DB=shidur_dev
  export SHIDUR_DEV_USER=shidur_db_user
  export SHIDUR_DEV_PASS='password'
  export SHIDUR_TEST_DB=shidur_test
  export SHIDUR_TEST_USER=shidur_db_user
  export SHIDUR_TEST_PASS='password'
```
* Inside the rails code folder enter commands:
```bash
  bundle install --path=vendor
  rake db:migrate db:seed
  RAILS_ENV=test rake db:migrate
```
* You can run tests by executing
```bash
  bundle exec rspec
```
* You can run server in dev mode with
```bash
  bundle exec rails s
```
that starts one thin on port 3000 and binded on every interface
* You can run console with
```bash
  bundle exec rails c
```
* Use `rails --help` for other options, like -p3001 -b127.0.0.1 for starting the server on other port and ip-address
* Use variable `RAILS_ENV=[development|test|production]` for starting console or server in needed mode
* You can omit `bundle exec` if you don't have another versions of the rails and rake executables, or prepend every command with that code if you have trubles with versions.
