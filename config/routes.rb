Rails.application.routes.draw do

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "about" => "homes#abouts", as:"about"
  resources :items, only:[:index, :show]
  get "customers/my_page" => "customers#show", as:"my_page"
  resource :customers, only:[:edit, :update] do
    collection do
      get :unsubscribe
      patch :withdraw
    end
  end
  resources :cart_items, except:[:new, :show, :edit] do
    member do
      delete :destroy_all
    end
  end
  resources :orders, except:[:edit, :update, :destroy] do
    member do
      post :confirm
      get :thanks
    end
  end
  resources :addresses, except:[:new, :show]

  devise_for :admins
  namespace :admin do
    root to:"hoems#top"
    resources :items, except:[:destroy]
    resources :genres, except:[:show, :destroy, :new]
    resources :customers, except:[:new, :create, :destroy]
    resources :orders, only:[:show, :update]
    patch "admin/order_details/:id" => "order_details#update", as:"order_detail_update"
  end

end
