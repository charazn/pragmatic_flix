require 'rails_helper'

describe "Viewing list of movies" do # example group

  it "shows the movies" do # code example

    movie1 = Movie.create(title: "Iron Man", 
                          rating: "PG-13",
                          total_gross: 318412101,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02")
    
    movie2 = Movie.create(title: "Superman", 
                          rating: "PG",
                          total_gross: 134218018,
                          description: "Clark Kent grows up to be the greatest super-hero",
                          released_on: "1978-12-15")
    
    movie3 = Movie.create(title: "Spider-Man", 
                          rating: "PG-13",
                          total_gross: 403706375,
                          description: "Peter Parker gets bit by a genetically modified spider",
                          released_on: "2002-05-03")

    visit movies_url

    expect(page).to have_text("3 Movies")

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..9])
    expect(page).to have_text(movie1.released_on.to_s(:release_date))
    expect(page).to have_text("$318,412,101.00")

  end
  
end
