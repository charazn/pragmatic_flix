describe "Create a movie" do

  it "creates a new movie and shows the new movie's details" do 

    visit movies_url

    click_link 'Add New Movie'
    expect(current_path).to eq(new_movie_path)

    fill_in 'Title', with: "New Movie Title"
    fill_in 'Rating', with: "R"
    fill_in 'Description', with: "New superhero movie that saves villians and kills innocent"
    fill_in 'Released on', with: (Time.now).to_s
    fill_in 'Total gross', with: 20_000_000 
    fill_in 'Image file name', with: "american sniper.jpg"
    fill_in 'Cast', with: "Tom Cruise, Bradley Cooper, Tom Hanks"
    fill_in 'Director', with: "Charlie Chaplin"
    fill_in 'Duration', with: 138

    click_button 'Create Movie'
    expect(current_path).to eq(movie_path(Movie.last))

    expect(page).to have_text('New Movie Title')

  end

  it "does not save the movie if it's invalid" do

    visit new_movie_path

    expect { click_button 'Create Movie' }.not_to change(Movie, :count)

    expect(current_path).to eq(movies_path)
    expect(page).to have_text('error')

  end

end
