# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [ #or Movie.create!([{title:"", rating:"", total_gross:0, description:"", released_on:""}])
 [
   title: "Iron Man", 
   rating: "PG-13",
   total_gross: 318_412_101,
   description: "Tony Stark builds an armored suit to fight the throes of evil",
   released_on: "2008-05-02",
   cast: ["Robert Downey Jr.", "Gwyneth Paltrow", "Terrence Howard"],
   director: "Jon Favreau",
   duration: 126,
   image_file_name: "ironman.jpg"
   ], 
 [
   title: "Superman", 
   rating: "PG",
   total_gross: 134_218_018,
   description: "Clark Kent grows up to be the greatest super-hero",
   released_on: "1978-12-15",
   cast: ["Christopher Reeve", "Margot Kidder", "Gene Hackman"],
   director: "Richard Donner",
   duration: 143,
   image_file_name: "superman.jpg"
   ], 
 [
   title: "Spider-Man", 
   rating: "PG-13",
   total_gross: 403_706_375,
   description: "Peter Parker gets bit by a genetically modified spider",
   released_on: "2002-05-03",
   cast: ["Tobey Maguire", "Kirsten Dunst", "Willem Dafoe"],
   director: "Sam Raimi",
   duration: 121,
   image_file_name: "spiderman.jpg"
   ],
 [
   title: "Catwoman",
   rating: "PG-13",
   total_gross: 40_200_000,
   description: "Patience Philips has a more than respectable career as a graphic designer",
   released_on: "2004-07-23",
   cast: ["Halle Berry", "Sharon Stone", "Benjamin Bratt"],
   director: "Jean-Christophe 'Pitof' Comar",
   duration: 101,
   image_file_name: "catwoman.jpg"
   ],
 [
   title: "Batman vs. Godzilla",
   rating: "PG",
   total_gross: 387623910,
   description: "The Caped Crusader battles the fire-breathing Gojira",
   released_on: 10.days.from_now,
   cast: ["Bruce Wayne", "Gojira"],
   director: "Ishiro Honda",
   duration: 211,
   image_file_name: "batman_godzilla.jpg"
   ],
 [
   title: "American Sniper",
   rating: "R",
   total_gross: 547_126_372,
   description: "Navy SEAL sniper Chris Kyle's pinpoint accuracy saves countless lives on the battlefield and turns him into a legend. Back home to his wife and kids after four tours of duty, however, Chris finds that it is the war he can't leave behind.",
   released_on: "2014-12-25",
   cast: ["Bradley Cooper", "Sienna Miller", "Kyle Gallner"],
   director: "Clint Eastwood",
   duration: 133,
   image_file_name: "american_sniper.jpg"
   ]
]


movies.each do | movie |
 Movie.create!(movie) #bang method will throw exception if movie is not created
end
