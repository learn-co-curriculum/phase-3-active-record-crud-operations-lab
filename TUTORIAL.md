#ActiveRecord - CRUD: Lab Tutorial
Learn to perform the basic CRUD actions using active record
##Important Points
It is important to understand how to use ActiveRecord to perform the CRUD actions since they will be the basis of your web applications!
##Create Tables
You can type run `Rake -T` in this project to find the rake tasks that are available to you. In this case these rake commands are available because we are using the Sinatra Active Record gem and it comes with many useful Rake Tasks. Use the rake task `rake db:create_migration NAME=create_movies` to create your movies table and get used to using the rake task to make your files!
Once the file is generated you can add the columns. Once completed it should look like 

```
class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title
      t.integer :release_date
      t.string  :director
      t.string  :lead
      t.boolean :in_theaters
    end
  end
end
```
You can then run `rake db:migrate` to migrate your datatabase and `rake db:migrate SINATRA_ENV=test` to migrate your test db so we can pass our specs.
##CRUD actions
Once you finish th emigration you will be able to start working with the crud actions. Some of the tests will pass by default. To start passing the tests open the `movies_controller.rb` and replace the ___ with the proper code to pass each test
### Can be instantiated and then saved
```
def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end
```
The first and third line of this method will need to be replaced. All  you have to do is create a new instance of the `Movie` class, it is given a title on line two and then use `save` to save it to the database. Since your model is inheriting from active record you just have to call the the method `save` on the instance of movie and it will be saved to the database. 
###Can be created with a hash of attributes

```
def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end
```
Here we give you a hash of attributes for your movie. All you have to do is use the active record method `create` which will instantiate and save. You can pass it a hash of attributes as an argument and provided the keys in the hash correspond to the columns in your table you will be able to save that instance to the database.
###Can be created in a block
```
def can_be_created_in_a_block
  Movie.create do |m|
    m.title = "A movie"
  end
end
```
The ActiveRecord create method can also take a block. In the above code within the block we add an attribute to an instance of movie created within a block which is then saved. 

### Can get the first item in the database
```
def can_get_the_first_item_in_the_database
  Movie.first.title
end
```
You can use the first method to return the first object in a table. From there you can then call on any attributes that object has. 

### Can get the last item in the database
```
def can_get_the_last_item_in_the_database
  Movie.last.title
end
```
You can use the last method similar to the first method to return the last row of the database and then access any attribute of that object

### Can get the size of the database
```
def can_get_size_of_the_database
  Movie.all.size
end
```
Calling all on a class with an associated active record table will return an array like object called `ActiveRecord::Relation` which will function like an array but remember, it is not an array. It does however have a lot of the same methods that arrays have so you can call size on it.
###Can find the first item from the database using id
```
def can_find_the_first_item_from_the_database_using_id
  Movie.find(1).title
end
```
Using the Active record `find` method we are able to pull out specific elements form the database. The default arugument for find is the ID, however as you will see later we can use other arguments as well.

### Can find by multiple attributes
```
def can_find_by_multiple_attributes
  # title == "Title"
  # release_date == 2000, 
  # director == "Me"
  Movie.find_by(title: "Title", release_date: 2000)
end
```
By using `find_by` instead of `find` we can use arguments besides `id` into our method with hash syntax and find the corresponding information.
### Can find using where clause
```
def can_find_using_where_clause
  # For this test return all movies released after 2002 and ordered by 
  # release date descending
  Movie.where("release_date > 2002").order(release_date: :desc)
end
```
The `where` method in active record is similar to `WHERE` in sql, it allows you to pass in a condition as an argument and will then only return rows from the database which containt the information stipulated.
### Can be found, updated, and saved
```
def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  Movie.create(title: "Awesome Flick")
  movie = Movie.find_by(title: "Awesome Flick")
  movie.title = "Even Awesomer Flick"
  movie.save
end
```
IN this section we create a moveie, find it by the title and then change the title. We no longer have to make a SQL statement to do so, we can just use ruby code to set the title equal to a different 
### Can be updated using the update method
```
def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  movie = Movie.find_by(title: "Wat?")
  movie.update(title: "Wat, huh?")
end
```
`update` is the preferred method to update your database using ActiveRecord. Update will replace the information in the columns you pass to it and then save it to the db.
### Can update multiple items at once
```
def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.update_all(title: "A Movie")
end
```
Using `update_all` you can update a column in multiple rows at once.
### Can destroy a single item
```
def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  movie = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  movie.destroy
end
```
You can use the destroy method to delete a row from your database
### Can destroy all items from a database (with one method)
```
def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all
end
```
Using destroy all will destroy all rows in the table corresponding to the model you called it on, provided that model is inheriting from ActiveRecord::Base