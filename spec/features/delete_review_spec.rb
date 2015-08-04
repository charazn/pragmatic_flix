# Test using Rspec it block doesn't work
# Gave weird database errors, even after installing shoulda-matchers and database_cleaner gems

describe "Delete a review" do

  it "deletes selected review and redirects to reviews listing page" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes(name: "Roger Ebert"))

    visit movie_reviews_url(movie)

    click_link 'Delete'
    expect(current_path).to eq(movie_reviews_path(movie))
    expect(page).to have_text('The review has been deleted.')
    expect(page).not_to have_text(review.name)
  end

end
