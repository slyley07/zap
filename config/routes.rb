Rails.application.routes.draw do
  get '/login', to: 'sessions#new'

  post '/', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/posts', to: 'posts#index', as: 'all_posts_index'

  resources :users do
	  resources :posts do
	    resources :comments
	  end
	end

  post '/', to: 'users#create'

  root 'welcome#index'
end
