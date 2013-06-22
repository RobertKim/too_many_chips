Toomanychips::Application.routes.draw do

  match 'auth/:provider/callback', to: 'session#oauth_create'
  match 'auth/failure', to: redirect('/')

  root to: 'pages#index'
  resources :users, :only => [:show, :create, :new, :edit] 
  get '/your_profile', to: 'users#your_profile', as: 'your_profile'
  resources :session, :only => [:destroy, :create]
  post '/login' => 'session#create', :as => 'login'
  match 'signout', to: 'session#destroy', as: 'signout'

  resources :events
  get '/:url' => 'events#invitation', :as => 'invitation'

  resources :items
  
  resources :assigned_items, :except => [:index]
  match 'remove', to: 'assigned_items#destroy', as: 'remove'
  resources :guests, :only => [:show, :edit, :new, :create]
  get '/rsvp/:url' => 'guests#show', :as => 'rsvp'

  mount Sidekiq::Web, at: "/sidekiq"

end
