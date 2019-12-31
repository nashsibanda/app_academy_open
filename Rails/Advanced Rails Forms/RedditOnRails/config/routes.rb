Rails.application.routes.draw do
  resources :comments, only: [:create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create]
  end
  resources :posts, only: [:show, :edit, :update, :destroy] do
    resources :crossposts, only: [:create]
    resources :comments, only: [:new, :create]
  end
  resources :subs do
    resources :posts, only: [:new]
  end
  resources :users
  resource :session, only: [:new, :create, :destroy]
  root to: 'static_pages#front_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
