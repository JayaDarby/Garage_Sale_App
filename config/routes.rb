Rails.application.routes.draw do
  root 'home#index'
  get 'find_garage_sales' => 'searches#garage_sales'
  get 'home' => 'home#index'
  get 'find_items' => 'searches#items'

  get '/signup', to: 'sessions#signup'
  post '/signup', to: 'sessions#create'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#attempt_login'
  get '/logout', to: 'sessions#logout'
  
  resources :items, only:[:show];
  resources :garage_sales, only:[:show]
  
  resources :users, only:[] do
    resources :garage_sales do
        resources :items
    end
  end

  resources :charges


  scope '/api' do
    scope '/garage_sales' do
      resources :garage_sales, :controller => "garage_sales_api", only:[:index, :show]
    end
    scope '/items' do
      resources :items, :controller => 'items_api', only:[:index, :show]
    end
    scope '/pictures' do
      resources :pictures, :controller => 'pictures_api'
    end
  end



  #resources :garage_sales, only:[:new, :create]
  #resources :users
  #resources :garage_sales
  #resources :items

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
