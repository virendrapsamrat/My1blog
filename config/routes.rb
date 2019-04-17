Rails.application.routes.draw do
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
  resources :comments
  root 'about#index'
end
end