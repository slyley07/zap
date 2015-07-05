Rails.application.routes.draw do
  post '/', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/posts', to: 'posts#index', as: 'all_posts_index'

  get '/profile/close', to: 'users#close', as: 'close_profile'

  resources :users do
	  resources :posts do
	    resources :comments
	  end
	end

  post '/', to: 'users#create'

  root 'welcome#index'
end
