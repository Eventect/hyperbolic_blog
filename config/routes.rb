Hyperbolic::Application.routes.draw do

  resources :posts
  resources :admin_toolbars, :only => [:show]
  root :to => 'posts#index'
end
