Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  get "/search", to: "searches#search"

  resources :chats, only: [:show, :create, :destroy]

  get 'tagsearches/search', to: 'tagsearches#search'
  
  get "posts_on_date" => "users#posts_on_date"
  
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
end
  
