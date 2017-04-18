Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  get 'admin/colors'

  get 'admin/news'

  get 'admin/products'

  get 'admin/categories'
  get 'admin/sizes'

  
  get 'admin' => 'admin#index'

  get 'admin/product_new'
  post 'admin/product_create'

  get 'admin/color_new'
  post 'admin/color_create'

  get 'admin/category_new'
  post 'admin/category_create'

   get 'admin/size_new'
  post 'admin/size_create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  


  # pages
  root 'pages#index'
  get 'pages/page' => 'pages#page'
  # cart
  get 'cart' => 'carts#cart'
  get 'checkout' => 'carts#checkout'
  get 'diver' => 'carts#diver'
  get 'order' => 'carts#order'
  #news
  get 'news' => 'news#news'
  get 'newsletter' => 'news#newsletter'
  get 'singlenew' => 'news#singlenew'
  #products
  get 'ladies' => 'products#ladies'
  
  get 'products/' => 'products#index'

  get 'products/:categorie0' => 'products#index'
  get 'products/:categorie0/:categorie1' => 'products#index'
  get 'products/:categorie0/:categorie1/:categorie2' => 'products#index'
  get 'products/:categorie0/:categorie1/:categorie2/:categorie3' => 'products#index'
  
  get 'search/' => 'products#search'
  get 'single/hm-:article' => 'products#single'

  get 'addtofavorite/:id' => 'products#addtofavorite'
  get 'removetofavorite/:id' => 'products#removetofavorite'
  get 'favourites' => 'products#favourites'
  
  resources :products, only: [:edit, :update, :destroy]
  #users
  get 'login' => 'users#login'
  get 'my-addressbook' => 'users#my-addressbook'
  get 'my-order' => 'users#my-order'
  get 'my-overview' => 'users#my-overview'
  get 'my-paymentinfo' => 'users#my-paymentinfo'
  get 'my-profile' => 'users#my-profile'
  

  resources :colors


end
