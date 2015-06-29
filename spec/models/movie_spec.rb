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

end
