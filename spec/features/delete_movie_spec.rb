describe "Delete a movie" do

  it "deletes selected movie and redirects to listing page" do 

    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link 'Delete Movie'
    expect(current_path).to eq(movies_path)
    expect(page).to have_text('Movie successfully deleted!')
    expect(page).not_to have_text(movie.title)

  end

end
