Taxidispatch::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations",
                                       :sessions => "sessions",
                                       :passwords => "passwords"} do

  end

  resources :my_accounts
  resources :rides
  resources :bookings
  resources :vehicle_preferences
  resource :user, only: [:show] do
    collection do
      patch 'update_password'
      get 'edit_password'

    end
  end

  get "get_address" => 'bookings#get_address'
  get "show_new_booking_map" => 'bookings#show_new_booking_map'
  get "booking_history" => 'bookings#booking_history'
  get "past_rides" => 'rides#past_rides'
  get "cancelled_rides" => 'rides#cancelled_rides'
  
  get "home/index"
  get "home/help"
  get "home/email_us"
  post "home/nearest_texi"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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
