def movie_attributes(overrides = {})
  { 
    title: "Iron Man", 
    rating: "PG-13",
    total_gross: 318412101,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    image_file_name: "american_sniper.jpg",
    director: "Charlie Chaplin",
    duration: 138,
    cast: ["Tom Cruise", "Bradley Cooper", "Tom Hanks"]
  }.merge(overrides)
end

def review_attributes(overrides = {})
  { 
    name: "Jason", 
    stars: 4,
    comment: "Movie about the top sniper in American military history.",
    movie: Movie.find_by(title: "American Sniper")
  }.merge(overrides)
end