describe "Edit a review for a certain movie" do

  it "updates the review and shows the review's updated details" do 

    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes(name: "Roger Ebert"))

    visit movie_reviews_url(movie)

    click_link 'Edit'
    expect(current_path).to eq(edit_movie_review_path(movie, review))

    expect(find_field('Name').value).to eq(review.name)
    expect(find_field('Stars').value.to_i).to eq(review.stars)
    expect(find_field('Comment').value).to eq(review.comment)

    fill_in 'Name', with: "Zhang Ziyi"

    click_button 'Update Review'
    expect(current_path).to eq(movie_reviews_path(movie))

    expect(page).to have_text('The review has been updated.')
    expect(page).to have_text('Zhang Ziyi')
  end

  it "does not update the review if it is invalid" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes(name: "Roger Ebert"))

    visit edit_movie_review_path(movie, review)

    fill_in 'Name', with: ""

    click_button 'Update Review'
    expect(page).to have_text('error')
  end

end
