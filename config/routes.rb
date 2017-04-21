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

  get 'admin/color_new'
  post 'admin/color_create'

  get 'admin/category_new'
  post 'admin/category_create'

   get 'admin/size_new'
  post 'admin/size_create'

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
