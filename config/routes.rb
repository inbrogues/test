Rails.application.routes.draw do

  root to:'pages#index'
  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations',
        passwords: 'admins/passwords'
      }

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }


  
  get 'admin/news'
  get 'admin' => 'admin#index'


  get 'admin/products'
  get 'admin/product_new'
  post 'admin/product_create'
  get 'admin/product_edit/:id'=> 'admin#product_edit', :as => :admin_product_edit
  patch 'admin/product_update/:id'=> 'admin#product_update', :as => :admin_product_update
  delete 'admin/product_destroy/:id'=> 'admin#product_destroy' , :as => :admin_product_destroy

  get 'admin/main_colors'
  get 'admin/main_color_new'
  post 'admin/main_color_create'
  get 'admin/main_color_edit/:id'=> 'admin#main_color_edit', :as => :admin_main_color_edit
  patch 'admin/main_color_update/:id'=> 'admin#main_color_update', :as => :admin_main_color_update
  delete 'admin/main_color_destroy/:id'=> 'admin#main_color_destroy' , :as => :admin_main_color_destroy


  get 'admin/colors'
  get 'admin/color_new'
  post 'admin/color_create'
  get 'admin/color_edit/:id'=> 'admin#color_edit', :as => :admin_color_edit
  patch 'admin/color_update/:id'=> 'admin#color_update', :as => :admin_color_update
  delete 'admin/color_destroy/:id'=> 'admin#color_destroy' , :as => :admin_color_destroy

  get 'admin/categories'
  get 'admin/category_new'
  post 'admin/category_create'
  get 'admin/category_edit/:id'=> 'admin#category_edit', :as => :admin_category_edit
  patch 'admin/category_update/:id'=> 'admin#category_update', :as => :admin_category_update
  delete 'admin/category_destroy/:id'=> 'admin#category_destroy' , :as => :admin_category_destroy

  get 'admin/baners'
  get 'admin/baner_new'
  post 'admin/baner_create'
  get 'admin/baner_edit/:id'=> 'admin#baner_edit', :as => :admin_baner_edit
  patch 'admin/baner_update/:id'=> 'admin#baner_update', :as => :admin_baner_update
  delete 'admin/baner_destroy/:id'=> 'admin#baner_destroy' , :as => :admin_baner_destroy

  get 'admin/pops'
  get 'admin/pop_new'
  post 'admin/pop_create'
  get 'admin/pop_edit/:id'=> 'admin#pop_edit', :as => :admin_pop_edit
  patch 'admin/pop_update/:id'=> 'admin#pop_update', :as => :admin_pop_update
  delete 'admin/pop_destroy/:id'=> 'admin#pop_destroy' , :as => :admin_pop_destroy

  get 'admin/orders'
  get 'admin/order_edit/:id'=> 'admin#order_edit', :as => :admin_order_edit
  patch 'admin/order_update/:id'=> 'admin#order_update', :as => :admin_order_update
  delete 'admin/order_destroy/:id'=> 'admin#order_destroy' , :as => :admin_order_destroy

  get 'admin/sizes'
  get 'admin/size_new'
  post 'admin/size_create'
  get 'admin/size_edit/:id'=> 'admin#size_edit', :as => :admin_size_edit
  patch 'admin/size_update/:id'=> 'admin#size_update', :as => :admin_size_update
  delete 'admin/size_destroy/:id'=> 'admin#size_destroy' , :as => :admin_size_destroy


  get 'admin/pages'
  get 'admin/page_new'
  post 'admin/page_create'
  get 'admin/page_edit/:id'=> 'admin#page_edit', :as => :admin_page_edit
  patch 'admin/page_update/:id'=> 'admin#page_update', :as => :admin_page_update
  delete 'admin/page_destroy/:id'=> 'admin#page_destroy' , :as => :admin_page_destroy


  # pages
  get 'pages/:link' => 'pages#page'
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

  get 'favourites' => 'products#favourites'
  
  #users
  get 'login' => 'users#login'
  get 'my-address' => 'users#my_address'
  post 'my-address/create' => 'users#address_create', :as => :users_address_create
  patch 'my-address/update/:id'=> 'users#address_update', :as => :users_address_update
  delete 'my-address/destroy/:id'=> 'users#address_destroy' , :as => :users_address_destroy


  get 'my-order' => 'users#my_order'
  get 'my-overview' => 'users#my_overview'
  get 'my-profile' => 'users#profile'
  patch 'small_user_update' => 'users#second_update', :defaults => { :format => 'json' }

  patch 'user_update' => 'users#update' , :as => :users_update
  
  get "liqpay_request" => 'carts#liqpay_request'
  post 'carts/order_create'
  post '/liqpay_payment' => 'payments#liqpay_payment'

end
