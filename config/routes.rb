Iic21542::Application.routes.draw do

  match '/tasks/comments/:id' => 'tasks#show_comments_of_task', :as => 'comments_task'

  get "/tasks/show_comments_of_task"

  resources :comments

   # route to getting task for a project
  match 'tasks/project_tasks/:id', :controller =>'tasks' , :action => 'project_tasks'
  match 'statuses/project_tasks/:id', :controller =>'statuses' , :action => 'project_statuses'
 

  resources :comments

  resources :project_statuses
  resources :comments
  root :to => 'application#home'

  resources :comments
  resources :evaluations
  resources :test_cases
  resources :bugs
  resources :roles
  resources :task_users
  resources :labels
  resources :commits
  resources :document_tasks
  resources :goals
  resources :statuses
  resources :requirement_templates
  resources :requirements
  resources :use_cases
  resources :tasks

  
  resources :projects do
    resources :project_role_users, only: [:new, :create, :destroy]
    resources :document_projects
    member do
      get '/boards/' => 'boards#show' , :as => 'boards'
      post :finish
      #resources :project_role_users
    end
  end


    get 'api/v1/getProjects' => 'api#getProjects'
    post 'api/v1/login' => 'api#login'
    delete 'api/v1/logout' => 'api#logout'

  #resources :boards

  # resources :users always below devise_for
  devise_for :users, :controller => {:registrations => "registrations", :sessions => "sessions"}
  resources :users, :only => [:create]




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
