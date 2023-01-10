Rails.application.routes.draw do
devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

devise_for :admin, skip: [:passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'public/posts#index'
  namespace :admin do
    resources :homes, only: [:index]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :destroy, :destroy_all]do
      resources :comments, only: [:show, :destroy]
    end
    resources :tags, only: [:index, :show, :destroy]
  end
  
  namespace :public do
    resources :end_users, only: [:index, :show, :edit, :update]
    get 'unsubscribe'=> 'end_users#unsubscribe'
    patch 'withdrow'=>'end_users#withdrow'
    resources :posts, only: [:new, :index, :show, :edit, :update, :destroy, :destroy_all, :create] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'posts_sarch', to: 'posts#search', as: 'post_search'
    get 'posts_favorite', to: 'posts#favorite'
    get 'end_user_favorite', to: 'favorites#index'
    resources :tags, only: [:index, :show, :destroy, :create]
    
    
  end
  
end
