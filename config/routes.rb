Rails.application.routes.draw do
  resources :links, only: %i[ index new create ]
  root to: 'links#index'
  
  get ':slug', to: 'links#redirect', as: :redirect

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
