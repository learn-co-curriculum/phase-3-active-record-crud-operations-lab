class Movie < ActiveRecord::Base
  def self.create_with_title(title)
    Movie.create(title: title)
  end

  def self.first_movie 
    Movie.first 
  end

  def self.last_movie 
    Movie.last 
  end

  def self.movie_count 
    Movie.count 
  end

  def self.find_movie_with_id(id) 
    Movie.find(id)
  end

  def self.find_movie_with_attributes(attributes)
    Movie.find_by(attributes)
  end

  def self.find_movies_after_2002 
    Movie.find_by_sql("SELECT * FROM movies WHERE release_date > 2002;")
  end

  def update_with_attributes(updated_attributes)
    self.update(updated_attributes)
  end

  def self.update_all_titles(updated_title) 
    Movie.update_all(title: updated_title)
  end
end
