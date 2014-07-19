Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'  
  get 'ancestors/search'

  devise_for :users
end
