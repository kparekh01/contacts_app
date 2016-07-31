Rails.application.routes.draw do
  get '/' => 'contacts#index'
  get '/contacts' => 'contacts#index'
  get '/contacts/new' => 'contacts#new'
  post '/contacts' => 'contacts#create'
  get '/contacts/:id' => 'contacts#show'

  get '/signup' => 'users#new'
	post '/users' => 'users#create'

  get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'


end
