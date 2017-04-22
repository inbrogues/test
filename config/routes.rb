Rails.application.routes.draw do

  root to:'pages#index'
  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  get 'admin/colors'

  get 'admin/news'

  get 'admin/products'

  get 'admin/categories'
  get 'admin/sizes'

  
  get 'admin' => 'admin#index'

  get 'admin/product_new'
  post 'admin/product_create'
  get 'admin/product_edit/:id'=> 'admin#product_edit', :as => :admin_product_edit
  patch 'admin/product_update/:id'=> 'admin#product_update', :as => :admin_product_update
  delete 'admin/product_destroy/:id'=> 'admin#product_destroy' , :as => :admin_product_destroy

  get 'admin/color_new'
  post 'admin/color_create'
  get 'admin/color_edit/:id'=> 'admin#color_edit', :as => :admin_color_edit
  patch 'admin/color_update/:id'=> 'admin#color_update', :as => :admin_color_update
  delete 'admin/color_destroy/:id'=> 'admin#color_destroy' , :as => :admin_color_destroy

  get 'admin/category_new'
  post 'admin/category_create'
  get 'admin/category_edit/:id'=> 'admin#category_edit', :as => :admin_category_edit
  patch 'admin/category_update/:id'=> 'admin#category_update', :as => :admin_category_update
  delete 'admin/category_destroy/:id'=> 'admin#category_destroy' , :as => :admin_category_destroy


  get 'admin/size_new'
  post 'admin/size_create'
  get 'admin/size_edit/:id'=> 'admin#size_edit', :as => :admin_size_edit
  patch 'admin/size_update/:id'=> 'admin#size_update', :as => :admin_size_update
  delete 'admin/size_destroy/:id'=> 'admin#size_destroy' , :as => :admin_size_destroy

  # pages
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
  get 'get' => 'products#test', :defaults => { :format => 'json' }
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
  get 'my-profile' => 'users#profile'
  

  resources :colors


end
