Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'rank/favorite' => 'ranks#favorite'
  get 'rank/ate' => 'ranks#ate'
  get 'search' => 'posts#search'

  resources :posts do
    resource :favorites, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
  end

  resources :users do
    resource :relationships, only: %i[create destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
