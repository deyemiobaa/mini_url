## Mini URL
Mini url is a simple url shortener written in ruby using rails and postgresql. Generate a short url for any long url and record the number of times it has been clicked.

### Setup and Installation for Development
- Clone the repo
- Run `bundle install`
- Add a password to the `config/database.yml` file
  - You can change the username if it is not `postgres`
- Run `rails db:create db:migrate` to create the database and run the migrations
- Start the server `bin/dev`

### Testing
All tests are written using rspec, and can be found in the spec folder. To run the tests, run `rspec spec` in the root directory.

Tests include:
- Model tests
- View tests
- Controller/Integration tests

### Author
##### [Sodiq Aderibigbe](https://sodiq.me)


