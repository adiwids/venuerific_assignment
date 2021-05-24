# Microblog

Microblog is a web application based on Ruby on Rails 6 that provide article reading feature and management panel.

This application is made to fulfill the assignment test at Venuerific as Ruby on Rails Developer.

## Live App

[Venuerific Microblog - Heroku](https://venuerificmblog.herokuapp.com/)

[Venuerific Admin Panel - Heroku](https://venuerificmblog.herokuapp.com/admin)

## Features

* Regular user registration
* User authorization and permission
* Data scope by user's role
* Blog as homepage using Start Bootstrap Clean Blog template
* Admin Panel using Start Bootstrap SB Admin template
* Basic Article CRUD via Admin Panel for registered user.

# Techs Used

* Ruby 2.7.2
* Rails 6.1.x
* PostgreSQL
* Heroku CLI

# Best Practices

* DRY in article form, using form partial for creating and editing article.
* Fat model skinny controller, store permitted attributes list on model rather than on controller method.
* Use indexing.
* Data scoping, filtering and ordering on database layer.
* Avoid N+1 queries using `includes`.

# Version

**1.0.0-rc1**

# How to run on local machine?

1. Clone repository
1. `cd` into project root directory
1. Install Ruby 2.7.2 `bundler:2.2.17` and `rails:6.1.3`
1. Install NodeJS 10 with latest NPM and `yarn` globally
1. Run `bundle install && yarn install`
1. Copy `.env.example` to `.env` and set it with your PostgreSQL credentials
1. Run `bundle exec rails db:create db:migrate db:seed ARTICLE_COUNT=<num of articles>`
1. Set administrator email and password when prompted
1. Run `bundle exec rails server` and open `http://localhost:3000/` on your browser

# TODO

* Administrator registration
* User info update (Profile Editing)
* Better pagination both on Blog and Admin Panel using `pagy` gem.
