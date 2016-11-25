Rails.application.routes.draw do



  resources :posts

  devise_for :users

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'home#front'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
