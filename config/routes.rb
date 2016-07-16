Rails.application.routes.draw do
  resources :organizations

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :seasons

  resources :users

  root 'seasons#index'
end
