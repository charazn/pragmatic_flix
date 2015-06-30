describe "View an individual movie" do

  it "shows the movie's details" do 

    movie = Movie.create(movie_attributes(total_gross: 300_000_000))

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description[0..9])
    expect(page).to have_text(movie.released_on.to_s(:release_date))
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
    expect(page).to have_text(movie.cast.join(", "))
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.duration)
    # expect(page).to have_text("$300,000,000.00") #covered in the two tests below

  end

  it "shows the total gross if the total gross is more than $50m" do
    movie = Movie.create(movie_attributes(total_gross: 300_000_000))

    visit movie_url(movie)

    expect(page).to have_text("$300,000,000.00")
  end

  it "shows 'Flop' if the total gross is is less than $50m" do
    movie = Movie.create(movie_attributes(total_gross: 20_000_000))

    visit movie_url(movie)

    expect(page).to have_text("Flop")
  end

end
