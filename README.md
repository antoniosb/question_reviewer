# README

Question Reviewer is a platform on which users can create Questions with 5 options, then another user with Administrative priviledges can review and update the status of any normal user question, giving feedback on rejection. There is also feedback history.

Getting Started

Question Reviewer works with 
* Ruby version 2.4.0p 

* Rails version 5.1.6

* SQLite3

and have the following dependencies

* Devise (user authentication)

* RSpec (test framework)

* FactoryBot (model factory to be used in tests)

* Pry Rails (Debugger)

To install all dependencies run
```console
bundle install
```

To configure database
```console
rake db:migrate db:seed
```

Run all tests suit
```console
bundle exec rspec spec 
```

Run project in local machine
```console
rails s 
```

Default admin user
email: admin@email.com
password: 12341234

To add a new admin:
- create a normal user
 
Then run on console
```console
rails c 
```
```console
User.find('newuser@email.com').admin! 
```

-----

### Rails ERD representation:

![erd.pdf](https://github.com/antoniosb/question_reviewer/edit/master/erd.pdf)
