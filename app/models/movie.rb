class Movie < ActiveRecord::Base

  def self.create_with_title(title)
    self.create(title: title)
  end

  def self.first_movie
    self.first
  end

  def self.last_movie
    self.last
  end

  def self.movie_count
    self.count
  end

  def self.find_movie_with_id(id)
    self.find(id)
  end

  def self.find_movie_with_attributes(attr)
    self.find_by(attr)
  end

  def self.find_movies_after_2002
    self.where("release_date > ?", 2002)
  end
end
