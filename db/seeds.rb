# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#or Movie.create!([{title:"", rating:"", total_gross:0, description:"", released_on:""}])
movies = [ 
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

reviews = [
 [
   name: "Craig Outhier",
   stars: 4,
   comment: "Led by Downey's career-resurrecting performance as billionaire weapons peddler Tony Stark, it proves just as indispensable to the movie's giddy escapist appeal as the seamless CGI effects and eye-popping pyrotechnics.",
   movie_id: 1
   ], 
 [
   name: "Mike Scott",
   stars: 5,
   comment: "His well-honed acting chops aside, a big reason the casting of Downey as Stark works so darn well is that incorrigible streak, which he somehow always has been able to balance with an irrepressible likability and which he uses to full effect here.",
   movie_id: 1
   ], 
 [
   name: "Pauline Kael",
   stars: 1,
   comment: "Superman doesn't have enough conviction or courage to be solidly square and dumb; it keeps pushing smarmy big emotions at us -- but half-heartedly.",
   movie_id: 2
   ], 
 [
   name: "Judith Martin",
   stars: 4,
   comment: "It's the simple, earth-bound quality of the film that makes this comic-book fantasy soar.",
   movie_id: 2
   ], 
 [
   name: "David Germain",
   stars: 4,
   comment: "With earnest, unpretentious delivery, Maguire is an eminently likable hero audiences will root for from his earliest moments as the class wimp.",
   movie_id: 3
   ], 
 [
   name: "David Edelstein",
   stars: 3,
   comment: "At its best, Spider-Man takes the adolescent yearning at the heart of most superhero sagas and gives it a lovely swing.",
   movie_id: 3
   ], 
 [
   name: "Andrea Gronvall",
   stars: 3,
   comment: "The screenplay's a hodgepodge of witchcraft, ancient Egyptian lore, pulp feminism, and a dash of S&M.",
   movie_id: 4
   ], 
 [
   name: "Joe Morgenstern",
   stars: 2,
   comment: "Catwoman's director, a visual-effects specialist named Pitof, is not contained by the rules of filmmaking. Scenes that make sense? Nonsense. Characters with inner lives? Utterly passe.",
   movie_id: 4
   ], 
 [
   name: "Jaryl Sim",
   stars: 5,
   comment: "It is the most wonderful movie I have ever watched!",
   movie_id: 5
   ], 
 [
   name: "Sunny Satrughan",
   stars: 5,
   comment: "Wow! Can I watch it again?!",
   movie_id: 5
   ], 
 [
   name: "Dana Stevens",
   stars: 4,
   comment: "American Sniper has a perspective that's recognizable from the classic Westerns Eastwood has long been associated with, both as an actor and a director. It's an existential critique of violent machismo that doubles as a celebration of violence.",
   movie_id: 6
   ], 
 [
   name: "John Powers",
   stars: 4,
   comment: "It speaks emotionally to audiences who sense that we lost something in Iraq, yet still want to honor the heroism of those who risked their lives for the cause, whether or not it was ultimately a great one.",
   movie_id: 6
   ]
]


movies.each do | movie |
 Movie.create!(movie) #bang method will throw exception if movie is not created
end

reviews.each do | review |
 Review.create!(review)
end
