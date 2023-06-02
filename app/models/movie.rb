class Movie < ActiveRecord::Base
    def self.create_with_title(title)
        movie = self.new(title: title)
        movie.save
        movie
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
    
      def self.find_movie_with_attributes(attributes)
        self.find_by(attributes)
      end
    
end

