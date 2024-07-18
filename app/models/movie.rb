class Movie < ActiveRecord::Base

  def self.create_with_title title
    Movie.create(title: title)
  end

  def self.first_movie
    Movie.first
  end

  def self.last_movie
    Movie.last
  end


end
