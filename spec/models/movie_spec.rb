describe Movie do
  let(:movie) { Movie.new }
  let(:attributes) do 
    {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
    }
  end

  it 'inherits from ActiveRecord::Base' do
    expect(Movie.superclass).to eq(ActiveRecord::Base)
  end

  it 'has a title' do
    movie.title = "The Matrix"
    expect(movie.title).to eq("The Matrix")
  end

  it 'has a release date' do
    movie.release_date = 1999
    expect(movie.release_date).to eq(1999)
  end

  it 'has a director' do
    movie.director = "The Wachowski Sisters"
    expect(movie.director).to eq("The Wachowski Sisters")
  end

  it 'has a lead actor/actress' do
    movie.lead = "Keanu Reeves"
    expect(movie.lead).to eq("Keanu Reeves")
  end

  it 'has an in theaters flag' do
    movie.in_theaters = false
    expect(movie.in_theaters?).to be(false)
  end

  it 'can be instantiated with a hash of attributes' do
    expect { Movie.new(attributes) }.not_to raise_error
  end

  describe 'Create' do

    describe '.create_with_title' do
      it 'saves the title to the movie' do
        titled_movie = Movie.create_with_title("This is a title.")
        expect(titled_movie.title).to eq("This is a title.")
      end
  
      it 'creates a new record in the database' do
        expect { Movie.create_with_title("This is a title.") }.to change(Movie, :count).by(1)
      end
    end

  end

  describe 'Read' do
    before do
      Movie.create(title: "Movie_0", release_date: 2000)
      Movie.create(title: "Movie_1", release_date: 2001)
      Movie.create(title: "Movie_2", release_date: 2002)
      Movie.create(title: "Movie_3", release_date: 2003)
      Movie.create(title: "Movie_4", release_date: 2004)
    end
    
    describe '.first_movie' do
      it 'returns the first item in the movies table' do
        expect(Movie.first_movie.title).to eq("Movie_0")
      end
    end
    
    describe '.last_movie' do
      it 'returns the last item in the movies table' do
        expect(Movie.last_movie.title).to eq("Movie_4")
      end
    end

    describe '.movie_count' do
      it 'returns the number of items in the movies table' do
        expect(Movie.movie_count).to eq(5)
      end
    end

    describe '.find_movie_with_id' do
      it 'returns the movie with the corresponding id' do
        expect(Movie.find_movie_with_id(1).title).to eq("Movie_0")
      end
    end

    describe '.find_movie_with_attributes' do
      it 'returns the movie with the corresponding attributes' do
        found_movie = Movie.find_movie_with_attributes(title: "Movie_0", release_date: 2000)
        expect(found_movie.title).to eq("Movie_0")
      end
    end

    describe '.find_movies_after_2002' do
      it 'returns a list of movies released after 2002' do
        found_movies = Movie.find_movies_after_2002

        expect(found_movies).to match_array([
          have_attributes(class: Movie, title: "Movie_3", release_date: 2003),
          have_attributes(class: Movie, title: "Movie_4", release_date: 2004)
        ])
      end
    end

  end

  describe 'Update' do

    describe '#update_with_attributes' do
      it 'updates one movie' do
        movie = Movie.create(title: "Awesome Flick")
  
        expect do 
          movie.update_with_attributes(title: "Even Awesomer Flick")
        end.to change(movie, :title).from("Awesome Flick").to("Even Awesomer Flick")
      end
    end

    describe '.update_all_titles' do
      it 'updates the title of all the movies' do
        Movie.create(title: "Awesome Flick")
        Movie.create(title: "Even Awesomer Flick")
        
        Movie.update_all_titles("Untitled")
  
        expect(Movie.where(title: "Untitled").count).to be(2)
      end
    end
  end

  describe 'Delete' do
    before do
      Movie.create(title: "Movie_0", release_date: 2000)
      Movie.create(title: "Movie_1", release_date: 2001)
      Movie.create(title: "Movie_2", release_date: 2002)
      Movie.create(title: "Movie_3", release_date: 2003)
      Movie.create(title: "Movie_4", release_date: 2004)
    end

    describe '.delete_by_id' do
      it 'deletes the record with the corresponding id' do
        expect { Movie.delete_by_id(1) }.to change(Movie, :count).from(5).to(4)
      end
    end

    describe '.delete_all_movies' do
      it 'deletes all the movies from the movies table' do
        expect { Movie.delete_all_movies }.to change(Movie, :count).from(5).to(0)
      end
    end
  end

end
