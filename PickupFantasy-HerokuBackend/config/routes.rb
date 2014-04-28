Testapp::Application.routes.draw do
  resources :gamesofweeks

  resources :seasonplayerdata

  resources :weekplayerdata

  resources :test_calls

  resources :test_objects

  resources :test_seasons

  resources :test_scoring_plays

  resources :test_plays

  resources :test_team_stats

  resources :test_teams

  resources :test_meta

  resources :test_statuses

  resources :test_line_scores

  resources :test_actives

  resources :test_play_stats

  resources :rosters

  
  get 'leagues/:name' => 'leagues#show'
  resources :leagues
  
  #get 'users/:username', :to => 'users#show'
  #get ':users/:show/:username', controller: "users", action: "show"
  get 'users/:username' => 'users#show'
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
