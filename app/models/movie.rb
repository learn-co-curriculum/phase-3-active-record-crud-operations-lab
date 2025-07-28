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
end
