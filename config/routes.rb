Rails.application.routes.draw do

  root 'movies#index'

  get '/movies' => 'movies#index'
  get '/movies/:id' => 'movies#show', as: 'movie'
  get '/movies/:id/edit' => 'movies#edit', as: 'edit_movie'
  patch 'movies/:id' => 'movies#update'
  #By convention in Rails, POST requests are used to create things. 
  #But Rails knows that we're trying to update a movie, not create a movie. 
  #By convention in Rails, PATCH requests are used to update things. 
  #Rails effectively overrides the HTTP verb by adding a hidden field named _method 
  #with a value of patch. 
  #(It has to fake it with a hidden field because web browsers can't natively 
  #send PATCH requests.)

end
