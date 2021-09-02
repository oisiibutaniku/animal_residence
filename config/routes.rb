Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'animals#index'
  resources :animals do
    resource :favorites, only: [:create, :destroy, :show]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users do
    resource :relationships, only: [:create, :destroy, :show]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end

end
