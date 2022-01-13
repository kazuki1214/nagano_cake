Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "home/about" => "homes#about", as:"about"
  
end
