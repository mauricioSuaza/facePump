Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]

  devise_scope :user do
    authenticated :user do
      root to: 'posts#index'
    end

    unauthenticated :user do
      root 'devise/sessions#new'
    end
  end

  resources :posts do
    member do
      post "like", to: "posts#upvote", as: "like"
      post "dislike", to: "posts#downvote", as: "dislike"
    end
  end


  post 'comments' => 'comments#create', as: "create_comment"

  resources :users do
    member do
      put "add", to: "friendship#add", as: "add"
      put "accept", to: "friendship#accept", as: "accept"
      put "decline", to: "friendship#decline", as: "decline"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
