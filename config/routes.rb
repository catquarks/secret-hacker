Rails.application.routes.draw do
	resources :users, only: [:index, :show, :create, :update]
	resources :secrets, only: [:show, :index, :new, :create]
	resources :keys, only: [:create]
	post '/key_entry', to: 'keys#acquire'

	root to: 'welcome#show'
	get '/dashboard', to: 'users#dashboard', as: 'dashboard'

	get '/login', to: 'sessions#new', as: 'login'
	post '/login', to: 'sessions#create', as: 'new_session'
	get '/logout', to: 'sessions#destroy', as: 'logout'

	get '/signup', to: 'registrations#new', as: 'signup'
	post '/signup', to: 'registrations#create', as: 'registrations'

	get '/profile', to: 'users#show', as: 'profile'
	get '/profile/edit', to: 'users#edit', as: 'edit_profile'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
