Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: 'home#index', as: 'home'
  end

  unauthenticated :user do
    root 'home#front'
  end

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end

  post 'comments' => 'comments#create', as: "create_comment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
