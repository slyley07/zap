Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'
  
  get '/posts', to: 'posts#index', as: 'all_posts_index'

  resources :users do
	  resources :posts do
	    resources :comments
	  end
	end

  root 'welcome#index'
end