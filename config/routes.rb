Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  mount Lookbook::Engine, at: "/lookbook" if Rails.env.development?
end
