Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show, :destroy] do
    resources :goals, only: [:new]
  end
  resources :goals, only: [:create, :edit, :update, :show, :destroy] do
  end
  resources :comments, only: [:create, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  get "/pages/:page" => "pages#show"

  root "pages#show", page: "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
