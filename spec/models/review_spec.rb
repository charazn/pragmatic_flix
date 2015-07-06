# require 'rails_helper'

# RSpec.describe Review, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe "A review" do

  # Model tests
  # ==========================================================

  it "belongs to a movie" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.new(review_attributes)
    review.valid?
    expect(review.movie).to eq(movie)
  end

  it "with example attributes is valid" do
    review = Review.new(review_attributes)
    expect(review.valid?).to eq(true)
  end

  it "requires a name" do
    review = Review.new(name: "")
    review.valid?
    expect(review.errors[:name].any?).to eq(true)
  end

  it "requires a stars rating" do
    review = Review.new(stars: "")
    review.valid?
    expect(review.errors[:stars].any?).to eq(true)
  end

  it "accepts star values of 1 through 5" do
    stars = [1, 2, 3, 4, 5]
    stars.each do |star|
      review = Review.new(stars: star)
      review.valid?
      expect(review.errors[:stars].any?).to eq(false)
    end
  end

  it "rejects star values not of 1 through 5" do
    stars = [-1, 0, 7]
    stars.each do |star|
      review = Review.new(stars: star)
      review.valid?
      expect(review.errors[:stars].any?).to eq(true)
    end
  end

  it "requires a comment" do
    review = Review.new(comment: "")
    review.valid?
    expect(review.errors[:comment].any?).to eq(true)
  end

  it "accepts a comment with more than 4 characters or more" do
    review = Review.new(comment: "X"*5)
    review.valid?
    expect(review.errors[:comment].any?).to eq(false)
  end  

  it "rejects a comment with less than 4 characters" do
    review = Review.new(comment: "X"*3)
    review.valid?
    expect(review.errors[:comment].any?).to eq(true)
  end  

end