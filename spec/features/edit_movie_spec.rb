describe "Edit an individual movie" do

  it "updates the movie and shows the movie's updated details" do 

    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link 'Edit'
    expect(current_path).to eq(edit_movie_path(movie))

    expect(find_field('Title').value).to eq(movie.title)
    expect(find_field('Rating').value).to eq(movie.rating)
    expect(find_field('Description').value).to eq(movie.description)
    expect(find_field('Released').value).to eq(movie.released_on.to_s) 
    #if leave out .to_s, will throw error because without .to_s will get 
    #Fri, 02 May 2008, the default date format

    fill_in 'Title', with: "Updated Movie Title"

    click_button 'Update Movie'
    expect(current_path).to eq(movie_path(movie))

    expect(page).to have_text('Updated Movie Title')

  end

end
