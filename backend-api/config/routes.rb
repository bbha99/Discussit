Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/register' => 'users#new'
  post '/users' => 'users#create'
  get '/admin' => 'admin/topics#index'
  resources :posts, only: [:index]

  resources :post_likes, only: [:create]
  post '/post_likes/delete' => 'post_likes#destroy'

  namespace :admin do
    root to: 'dashboard#shows'
    resources :topics, except: [:destroy, :show]
    get 'login' => 'sessions#new'
    get 'dashboard' => 'dashboard#index'
  end

end
