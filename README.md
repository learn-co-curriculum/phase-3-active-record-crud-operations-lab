# Active Record CRUD Operations Lab

## Introduction

The goal of this lab is to get comfortable performing CRUD (Create, Read,
Update, Delete) actions using Active Record.

There are different ways to solve this lab so feel free to experiment!

## Setup

First, run `bundle install` to install the dependencies from the Gemfile.

Next, run `bundle exec rake -T`, which will list all of the rake tasks you have
available in this lab. These tasks come with the `sinatra-activerecord` gem.

Start the lab by running `learn test` or keep reading for more instructions.

## Create Table

Try using a Rake task to create your migration file:

```console
$ bundle exec rake db:create_migration NAME=create_movies
```

Once you have a migration file, add columns like so:

| Column Name  | Type      |
| ------------ | --------- |
| title        | (string)  |
| release_date | (integer) |
| director     | (string)  |
| lead         | (string)  |
| in_theaters  | (boolean) |

After your migration is ready, run both these commands:

```console
$ bundle exec rake db:migrate
$ bundle exec rake db:migrate RAKE_ENV=test
```

This will migrate your development database as well as a test database so you
will be able to run `learn test`.

You can also run this command to generate some sample data:

```console
$ bundle exec rake db:seed
```

This will run the code in the `db/seeds.rb` file in order to create some movies.

Then, if you want to try out your code in the console, run:

```console
$ bundle exec rake console
```

Use the console to explore various Active Record methods that you'll need in
order to pass the tests.

## Instructions

Run `learn test` to see the tests. You'll be adding new methods to the `Movie`
class in `app/models/movie.rb` that take advantage of Active Record's build-in
functionality.

The goal of this is to add some functionality to your `Movie` class while taking
advantage of Active Record's built-in methods. For example, you might write a
method `Movie.find_all_movies_by_year` that finds all the movies for a given
year:

```rb
class Movie < ActiveRecord::Base

  def self.find_all_movies_by_year(year)
    Movie.where(year: year)
  end

end
```

`.where` is a built-in Active Record method that queries the database and
returns a list of all items that match the criteria being passed as an argument.

Each test will take us through performing a basic CRUD action using the database
we just created. You'll need to refer to the
[Active Record Query Interface][querying] documentation to find the best methods
to use.

**Note**: Pay attention to which methods are instance methods (`#`) and which
are class methods (`.`).

### Create

- A movie can be instantiated, given a title, and saved

### Read

- Can return the first item in the table
- Can return the last item in the table
- Can return the number of records in the table
- Can return a movie from the table based on its id with the `.find` method
- Can return a movie from the table based on its attributes with the
  `.find_by` method
- Can use a `.where` clause to select the appropriate movies released after 2002

### Update

- Can update a single movie using the `#update` method
- Can update the title of all records at once using the `.update` method

### Delete

- Can delete a single item with the `#destroy` method
- Can delete all items at once with the `.destroy_all` method

## Resources

- [Active Record Query Interface][querying]

[querying]: https://guides.rubyonrails.org/active_record_querying.html
