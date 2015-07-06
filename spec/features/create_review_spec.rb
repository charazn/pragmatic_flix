describe "Create a review" do

  it "creates a new review and shows the list of the movie's reviews" do 

    movie = Movie.create(movie_attributes)

    visit movie_path(movie)

    click_link 'Write Review'
    expect(current_path).to eq(new_movie_review_path(movie))

    fill_in 'Name', with: "Rotten Tomatoes"
    select 3, from: "review_stars"
    fill_in 'Comment', with: "The movie sucks!"

    click_button 'Post Review'
    expect(current_path).to eq(movie_reviews_path(movie))

    expect(page).to have_text('Thanks for your review!')

  end

  it "does not save the movie if it's invalid" do

    movie = Movie.create(movie_attributes)

    visit new_movie_review_path(movie)

    expect { click_button 'Post Review' }.not_to change(Review, :count)
    expect(current_path).to eq(movie_reviews_path(Movie.last))
    expect(page).to have_text('error')

  end

end
