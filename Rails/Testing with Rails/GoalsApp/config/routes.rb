Rails.application.routes.draw do
  resources :goals
  resources :users, only: [:index, :new, :create, :show, :destroy]
  resource :session, only: [:new, :create, :destroy]
  get "/pages/:page" => "pages#show"

  root "pages#show", page: "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
