describe "A movie" do

  # Model tests
  # ==========================================================

  it "requires a title" do
    movie = Movie.new(title: "")
    movie.valid? # populates errors
    expect(movie.errors[:title].any?).to eq(true)
  end

  it "requires a released_on" do
    movie = Movie.new(released_on: "")
    movie.valid?
    expect(movie.errors[:released_on].any?).to eq(true)
  end

  it "requires a duration" do
    movie = Movie.new(duration: "")
    movie.valid?
    expect(movie.errors[:duration].any?).to eq(true)
  end

  it "requires a description with a minimum of 25 characters" do
    movie = Movie.new(description: "too short description")
    movie.valid?
    expect(movie.errors[:description].any?).to eq(true)
  end

  it "requires the total_gross to be a number, not a string" do
    movie = Movie.new(total_gross: "one")
    movie.valid?
    expect(movie.errors[:total_gross].any?).to eq(true)
  end

  it "requires the total_gross to be a number greater than or equal to zero" do
    movie = Movie.new(total_gross: 0)
    movie.valid?
    expect(movie.errors[:total_gross].any?).to eq(false)
  end

  it "requires the total_gross to be a non-negative number" do
    movie = Movie.new(total_gross: -1)
    movie.valid?
    expect(movie.errors[:total_gross].any?).to eq(true)
  end

  it "accepts properly formatted image file names" do
    file_names = %w(e.png movie.png movie.jpg movie.gif MOVIE.GIF)
    file_names.each do |file_name|
      movie = Movie.new(image_file_name: file_name)
      movie.valid?
      expect(movie.errors[:image_file_name].any?).to eq(false)
    end
  end

  it "rejects improperly formatted image file names" do
    file_names = %w(movie .jpg .png .gif movie.pdf movie.doc)
    file_names.each do |file_name|
      movie = Movie.new(image_file_name: file_name)
      movie.valid?
      expect(movie.errors[:image_file_name].any?).to eq(true)
    end
  end

  it "accepts only approved ratings" do
    ratings = %w(G PG PG-13 R NC-17)
    ratings.each do |rating|
      movie = Movie.new(rating: rating)
      movie.valid?
      expect(movie.errors[:rating].any?).to eq(false)
    end
  end

  it "rejects ratings not in approved list" do
    ratings = %w(GP PGG PG-12 RR NC-16)
    ratings.each do |rating|
      movie = Movie.new(rating: rating)
      movie.valid?
      expect(movie.errors[:rating].any?).to eq(true)
    end
  end

  # it "is valid with example attributes" do
  #   movie = Movie.new(movie_attributes)
  #   expect(movie.valid?).to eq(true)
  # end

  # Controller tests
  # ==========================================================

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
