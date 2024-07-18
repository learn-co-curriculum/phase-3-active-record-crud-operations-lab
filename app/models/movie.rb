class Movie < ActiveRecord::Base
  def self.create_with_title(title)
    create(title: title)
  end

  def self.first_movie = first
  
  def self.last_movie = last

  def self.movie_count = count

  def self.find_movie_with_id(id) = find(id)

  def self.find_movie_with_attributes(attr) = find_by(attr)

  def self.find_movies_after_2002 = where("release_date > ?", 2002)

  def update_with_attributes(attr) = update(attr)

  def self.update_all_titles(title) = update(title: title)

  def self.delete_by_id(id) = find_movie_with_id(id).destroy

  def self.delete_all_movies = destroy_all
end
