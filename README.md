### Commits-Importer Ruby(Rails) application implemented with ActiveRecord, RSpec
### Description:

  The APP returns a list of commits from given Github repository.  

### Dependencies:
- Ruby 2.2.1
- PostgreSQL

### Installation:
   - Clone poject
   - Run bundler:

   ```shell
   $ bundle install
   ```
   Create database.yml:
   ```shell
   $ cp config/database.yml.sample config/database.yml
   $ bundle exec rake db:create db:migrate
   ```
   - Run application:
   ```shell
    $ rails s -p 3000
   ```
   
   ##### Tests:

   To execute tests, run following commands:

   ```shell
    $ bundle exec rake db:migrate RAILS_ENV=test #(the first time only)
    $ bundle exec rspec
   ```

### License

The software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
