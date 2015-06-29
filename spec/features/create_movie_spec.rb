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

    click_button 'Create Movie'
    expect(current_path).to eq(movie_path(Movie.last))

    expect(page).to have_text('New Movie Title')

  end

end
