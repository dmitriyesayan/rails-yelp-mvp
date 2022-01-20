Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'restaurants/index'
  get 'restaurants/new'
  get 'restaurants/create'
  get 'restaurants/show'
  resources :restaurants, only: [ :index, :create, :new, :show ] do
    resources :reviews, only: [ :index, :new, :create ]
  end
end
