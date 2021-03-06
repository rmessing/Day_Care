Rails.application.routes.draw do

  get "/meals/new" => "meals#new"
  post "/meals/new" => "groups#view"
  get "/meals/:id" => "groups#show", as: :group_meals
  post "/meals/:id" => "groups#show"
  get "/rpt_attend/" => "centers#rpt_attend"
  get "/rpt_meal/" => "centers#rpt_meal"

  resources :centers, only: [:show]
  resources :children, except: [:new]
  resources :groups
  resources :handoffs, only: [:create, :destroy]
  resources :meals, only: [:new, :create, :update, :destroy]
  resources :parents
  resources :teachers
  resources :families, only: [:new, :index, :create]

  root "home#index"

  get "/parent-log-in" => "sessions#new_parent", as: :parent_log_in

  post "/parent-log-in" => "sessions#create_parent"

  delete "/parent-log-out" => "sessions#destroy_parent", as: :parent_log_out

  get "/teacher-log-in" => "sessions#new_teacher", as: :teacher_log_in

  post "/teacher-log-in" => "sessions#create_teacher"

  delete "/teacher-log-out" => "sessions#destroy_teacher", as: :teacher_log_out

  get "/center-log-in" => "sessions#new_center", as: :center_log_in

  post "/center-log-in" => "sessions#create_center"

  delete "/center-log-out" => "sessions#destroy_center", as: :center_log_out

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
