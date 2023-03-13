Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root "home#index"

  mount Lookbook::Engine, at: "/lookbook" if Rails.env.development?

  resources :leagues, only: %i[index new create show edit update]

  resources :leagues do
    post "join", on: :member
  end

  resources :contests, only: %i[index new create show]
end
