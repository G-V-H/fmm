Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/', to: 'pages#home', as: 'root'

  get '/posts', to: 'posts#index', as: 'posts'
  post '/posts', to: 'posts#create', as: "create_post"
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/posts/dashboard', to: 'posts#dashboard', as: 'dashboard'
  get '/posts/:id', to: 'posts#show', as: 'post'
  put '/posts/:id', to: 'posts#update'
  patch '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy', as: 'destroy_post'
  get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'

  post '/reviews', to: 'reviews#create', as: 'create_review'

  post '/messages', to: 'messages#create', as: 'create_message'
  delete '/messages/:id', to: 'messages#destroy', as: 'destroy_message'

  get '*path', to: 'posts#redirect', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }

end
