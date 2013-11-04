Jobs::Application.routes.draw do
  get "dashboard/index"

  # get "sessions/new"

  get "customers/index"

  get "owners/index"

  get "users/index"

  get "parts/index"

  # root :to => 'Jobs#index'
  # root :to => 'sessions#new'

  resources :jobs
  resources :users
  resources :owners
  resources :customers
  resources :sessions, only: [:new, :create, :destroy]
  resources :parts
  # resources :jobs, :collection => { :completed => :get }

  # match '/signup',  to: 'users#new'
  match '/signin',    to: 'sessions#new'
  match '/signout',   to: 'sessions#destroy'
  #match '/search',    to: 'jobs#show'
  match '/search',    to: 'jobs#show_searched'
  match '/declined',  to: 'jobs#show_declined'
  match '/canceled',  to: 'jobs#show_canceled'
  match '/completed', to: 'jobs#show_completed'
  # match '/view_job/:id', to: 'jobs#view_job'
  match '/view_job', to: 'jobs#view_job'


  # match '/jobs/:id/view_job', to: 'jobs#view_job'
  # match '/view_job', to: 'jobs/id/#view_job'
  

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
  namespace :admin do 
    get '', to: 'dashboard#index', as: '/' 
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'public#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
