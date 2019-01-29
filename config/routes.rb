Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    get 'location/get'
  end
  get 'dashboard/home'
  root 'dashboard#home'
end
