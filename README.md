---
tags: activerecord, orm, oop, introduction, crud
languages: ruby
---

# Active Record CRUD

## Description

In this lab, you'll be playing around with the basic CRUD features of Active Record. There are many ways to make the specs pass...experiment!

## Instructions

As usual, the first thing you should do (after reading this README, of course) is run `rspec` from your command line. In roughly this order, make all the specs pass:

1. Run `bundle`
2. Run `rake -T`, which should list all of the rake tasks we have available to interact with our database with ActiveRecord. We have these tasks because of the `sinatra-activerecord` gem.
3. `rake db:create_migration NAME=create_movies` generates a migration file. Write a migration to create the 'movies' table. 
4. Note: It may be helpful to read through `spec/models/movie_spec.rb` to figure out what columns you need to create in your migration file.
5. Look at `db/seeds.rb`. `rake db:seed` will take this file, and populate the database with it.
5. Move through the specs, filling in the `__` with code that makes them pass. Pay very close attention to the language in the test descriptions. If a test uses the word "create", for instance, it is probably asking you to use a `create` method somewhere in that test.
6. Each set of `__` represents one line of code that you need to add to your specs. Add exactly as many lines of code that are asked for.
7. One test, in particular, will be a bit tricky! You'll want to read up on the [Active Record Query Interface](http://guides.rubyonrails.org/active_record_querying.html).