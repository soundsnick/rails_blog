Rails.application.routes.draw do
  get '/signup', to: 'auth#signup', as: :signupPage
  get '/signin', to: 'auth#signin', as: :loginPage
  post '/login', to: 'auth#login', as: :login
  get '/login', to: 'auth#register', as: :register
  get '/logout', to: 'auth#logout', as: :logout

  get '/search', to: 'articles#search', as: :query
  resources :articles


  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
