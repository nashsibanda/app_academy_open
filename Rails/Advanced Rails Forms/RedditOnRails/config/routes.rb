Rails.application.routes.draw do
  resources :posts, only: [:show, :edit, :update, :create, :destroy]
  resources :subs do
    resources :posts, only: [:new]
  end
  resources :users
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
