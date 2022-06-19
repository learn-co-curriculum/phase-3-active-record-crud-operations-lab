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

  def self.find_movie_with_attributes(attr)
    Movie.find_by(attr)
  end

  def self.find_movies_after_2002
    Movie.where("release_date > 2002")
  end

  #UPDATE

  def update_with_attributes(attr)
    self.update(attr)
  end

  def self.update_all_titles(title)
    Movie.update(title: title)
  end
  #DELETE
  def self.delete_by_id(id)
    movie = Movie.find(id)
    movie.destroy
  end

  def self.delete_all_movies
    Movie.destroy_all
  end

end