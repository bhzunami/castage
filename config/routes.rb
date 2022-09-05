Castage::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :bookings, only: [:new, :create, :show, :index, :edit, :update] do
    post "accept"
    post "reject"
    post "archive"
  end

  root to: 'static_pages#home'

  #get '/bookings/simple_booking_new', to: 'bookings#new'
  match '/simple_booking', to: 'bookings#simple_booking_new', via: 'get'
  post '/simple_booking', to: 'bookings#simple_booking_create'
#static pages
  get '/property_description', to: 'static_pages#property_description'
  get '/contact',              to: 'static_pages#contact'
  get '/gallery',              to: 'static_pages#foto_gallery'
  get '/archived_bookings',    to: 'bookings#archived_bookings'

# Login
  match '/login',  to: 'sessions#new',         via: 'get'
  match '/logout', to: 'sessions#destroy',     via: 'delete'

  # Password restore
  get "/password_reset", to: 'users#show_password_reset', as: :password_reset
  post "/password_reset", to:'users#password_reset'
  get "/edit_password_reset/:id", to: 'users#edit_password_reset', as: :edit_password_reset
  post "/update_password_reset/:id", to: 'users#update_password_reset'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
