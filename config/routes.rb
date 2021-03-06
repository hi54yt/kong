require 'grape'
Kong::Application.routes.draw do
  mount Kong::API => "/"
  root to: 'home#index'
  get 'tags/:tag', to: 'home#index', as: :tag
  get 'category/:category', to: 'home#index', as: :category

  resources :users
  resources :posts, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  namespace :admin do
    get '/', to: 'posts#index'
    resources :posts, :except => [:show]
    resources :categories
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
