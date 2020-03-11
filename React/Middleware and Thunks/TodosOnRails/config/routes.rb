# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :todos, only: %i[show index update create destroy] do
      resources :steps, only: %i[index]
    end
    resources :steps, only: %i[update create destroy]
  end
  resources :users, only: %i[new create destroy]
  resource :session, only: %i[new create destroy]
  root to: 'static_pages#root'
end
