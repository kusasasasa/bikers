Rails.application.routes.draw do
devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'public/posts#index'
  namespace :admin do
    resources :homes, only: [:index]
    resources :end_users, only: [:show, :edit, :update, :unsubscribe, :withdrow]
    resources :posts, only: [:index, :show, :edit, :destroy, :destroy_all]
    resources :comments, only: [:destroy]
  end
  
  namespace :public do
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:new, :index, :show, :edit, :update, :destroy, :destroy_all, :create] do
      resource :favorites, only: [:create, :destroy]
    end
    get 'posts_sarch', to: 'posts#search', as: 'post_search'
    get 'posts_favorite', to: 'posts#favorite'
    
    resources :tags, only: [:show, :destroy, :create]
    resources :comments, only: [:index, :destroy, :create]
    
  end
  
end
