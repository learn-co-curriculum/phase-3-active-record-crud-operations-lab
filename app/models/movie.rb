class Movie < ActiveRecord::Base
    def self.create_with_title(title)
        movie = self.new(title: title)
        movie.save
        movie
      end
  
end