Shefuniathletics::Application.routes.draw do
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

   resources :new_athletes do
    get 'delete_all', on: :collection
   end

   resources :fixtures do
      get 'admin', on: :collection
   end

   resources :socials do
      get 'admin', on: :collection
   end

   resources :rec_run_routes do
    get 'admin', on: :collection
   end

   resources :records do
    get 'admin', on: :collection
    put 'sort', on: :collection
  end

   resources :committee_positions do
     put 'sort', on: :collection
   end

   resources :kit_items do
     put 'sort', on: :collection
   end

   resources :coaches do
     put 'sort', on: :collection
   end

   resources :key_dates do
      put 'sort', on: :collection
   end

   resources :historic_images do
      put 'sort', on: :collection
   end

   resources :events do
      put 'sort', on: :collection
   end

   resources :info_pages

   resources :admin_sessions, only: [:new, :create, :destroy]
   resources :admins do 
    get 'users', on: :collection
    get 'admin_users', on: :collection
    get 'new_athletes', on: :collection
   end

   get '/profile/:id' => 'users#profile', via: :get, as: 'profile'
   get '/splits/:id' => 'users#my_splits', via: :get, as: 'splits'
   

   match '/newsletter', to: 'new_athletes#new', via: 'get'
   match '/training', to: 'welcome#training', via: 'get'
   match '/runs', to: 'rec_run_routes#index', via: 'get'
   match '/membership', to: 'welcome#membership', via: 'get'
   match '/committee', to: 'welcome#committee', via: 'get'
   match '/clubcoaches', to: 'welcome#coaches', via: 'get'
   match '/socials', to: 'socials#index', via: 'get'
   match '/kit', to: 'welcome#kit', via: 'get'
   match '/fixtures', to: 'fixtures#index', via: 'get'
   match '/admin', to: 'welcome#admin', via: 'get'
   match '/records', to: 'records#index', via: 'get'
   match '/history', to: 'welcome#history', via: 'get'
   match '/beginners', to: 'welcome#beginners_run_group', via: 'get'

   match '/cloudinaryImages', to: 'welcome#getImagesFromCloudinary', via: 'get'
   match '/deleteCloudinaryImage/:image_id', to: 'welcome#deleteCloudinaryImage', via: 'get'
   #Facebook omniauth session routes
   match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
   match 'auth/failure', to: redirect('/'), via: [:get, :post]
   match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
   match '/signout_admin',   to: 'admin_sessions#destroy', as: 'signout_admin', via: [:get, :post]

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
end
