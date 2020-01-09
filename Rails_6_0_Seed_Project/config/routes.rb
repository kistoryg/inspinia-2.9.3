Rails.application.routes.draw do

  get "home/index"
  get "home/minor"

  root to: 'home#index'

end
