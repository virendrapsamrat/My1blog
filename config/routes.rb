Rails.application.routes.draw do
  devise_for :users
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
  resources :comments do
  	resources :likes do
  		collection do
				get 'hilike'
				get 'byelike'
      end
    end
   resources :replies do
     resources :reply_likes do
        collection do
          get 'like'
          get 'dislike'
        end
   end
  end
end
end
  root 'about#index'
end