describe "A movie" do
  
  it "is a flop if total gross is less than $50m" do
    movie = Movie.new(total_gross: 20_000_000) 
    #don't need to initialize the movie object with a full set of attributes.
    #don't need call the movie_attributes method.
    #movie is flop or not is dependent on value of its total gross,
    #so that's all is needed.

    #don't have to create the movie in the database. 
    #all we need is a movie object in memory that is then used to call the flop? method.
    #if you can avoid hitting the database, model specs will run faster.

    expect(movie.flop?).to eq(true)
  end

  it "is not a flop if total gross is more than $50m" do
    movie = Movie.new(total_gross: 70_000_000) 

    expect(movie.flop?).to eq(false)
  end

  it "is released when the released on date is in the past" do
    movie = Movie.create(movie_attributes(released_on: 3.months.ago))

    expect(Movie.released).to include(movie) #here we are not testing page, 
                                             #because this is a model test
  end

  it "is not released when the released on date is in the future" do
    movie = Movie.create(movie_attributes(released_on: 2.months.from_now))

    expect(Movie.released).not_to include(movie)
  end

  it "returns released movies ordered with most recently released movie first" do
    movie1 = Movie.create(movie_attributes(released_on: 1.month.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 3.months.ago))

    expect(Movie.released).to eq([movie1, movie2, movie3])

  end

end
