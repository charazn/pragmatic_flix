Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'movies#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/movies' => 'movies#index'
  get '/movies/:id' => 'movies#show', as: 'movie'
  get '/movies/:id/edit' => 'movies#edit', as: 'edit_movie'

end
