Rails.application.routes.draw do
  get '/search', to: 'articles#search', as: :query
  resources :articles


  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
