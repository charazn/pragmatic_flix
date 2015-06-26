describe "View an individual movie" do

  it "shows the movie's details" do 

    movie = Movie.create(movie_attributes(total_gross: 300_000_000))

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description[0..9])
    expect(page).to have_text(movie.released_on.to_s(:release_date))
    expect(page).to have_text("$300,000,000.00")

  end
  
end