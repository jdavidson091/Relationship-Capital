RelationshipCapital::Application.routes.draw do

  resources :users
  resources :commitments
  resources :sessions, only: [:new, :create, :destroy]
  root 'home_pages#home'
  match '/leaderboard', to: 'users#leaderboard', via: 'get'
  match '/edit_commitment', to: 'commitments#edit', via: 'get'
  match '/commitment_accept', to: 'commitments#accept', via: 'get'
  match '/commitment_fulfilled', to: 'commitments#fulfilled', via: 'get'
  match '/commitment_show', to: 'commitments#show', via: 'get'
  match '/commitment_feedback', to: 'commitments#feedback', via: 'get'
  match '/commitments', to: 'home_pages#home', via: 'get'
  match '/submit_feedback', to: 'commitments#submit_feedback', via: [:get, :post]
  match '/home', to: 'home_pages#home', via: 'get'
  match '/help', to: 'home_pages#help', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/settings', to: 'users#settings', via: 'get'
  match '/admin', to: 'users#admin_home', via: 'get'
  match '/notifications', to: 'users#notifications', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

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
