describe "Edit an individual movie" do

  it "updates the movie and shows the movie's updated details" do 

    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link 'Edit'

    expect(current_path).to eq(edit_movie_path(movie))

    expect(find_field('Title').value).to eq(movie.title)
    expect(find_field('rating').value).to eq(movie.rating)
    expect(find_field('Description').value).to eq(movie.description[0..9])
    expect(find_field('Released').value).to eq(movie.released_on.to_s(:release_date))

  end

end
