Rails.application.routes.draw do

  get '/search' => 'search#search', :as => 'search_page'
  get 'films/index'
  get 'spaceships/index'
  get 'planets/index'
  get 'peoples/index'
  get 'people/index'
  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
