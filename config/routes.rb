Hyperbolic::Application.routes.draw do

  resources :posts
  resources :users, :only => [:new, :create]
  resources :admin_toolbars, :only => [:show]
  root :to => 'posts#index'
end
