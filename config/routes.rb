China::Application.routes.draw do

  root 'site#index'

  get '/language/:language', to: 'site#language'
  get '/:action', to: 'site#:action', constraints: { action: /catalog|organizations/i }
  get 'organizations/:category', to: 'site#organizations', constraints: {category: /[-_a-z0-9]+/i}
  get 'organizations/:category/:id', to: 'site#organizationFull', constraints: {category: /[-_a-z0-9]+/i, id:/\d+/}

  get '/contacts',     to: 'contacts#new'

  match '/user/profile', to: 'site#profile', via: [:get, :patch]

  resources 'contacts', only: [:new, :create]

  devise_for :users, path: 'user', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: ''
  }



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
end
