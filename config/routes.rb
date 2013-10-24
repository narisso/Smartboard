Iic21542::Application.routes.draw do
  resources :use_case_groups


  get "github/authorize"

  get "github/callback"


  match '/tasks/comments/:id' => 'tasks#show_comments_of_task', :as => 'comments_task'

  get "/tasks/show_comments_of_task"

  # route to getting task for a project
  match 'tasks/project_tasks/:id', :controller =>'tasks' , :action => 'project_tasks'
  match 'statuses/project_tasks/:id', :controller =>'statuses' , :action => 'project_statuses'

  #Dropbox Routes
  match '/dropbox/authorize'   => 'dropbox#authorize' , :method => :get , :as => :dropbox_auth
  match '/dropbox/callback' => 'dropbox#callback' , :method => :get , :as =>  :dropbox_callback
  match 'tasks/reported_hours/:task_id/:user_id', :controller => 'tasks', :action => 'new_reported_hours', :as => 'new_reported_hours'
  post 'tasks/create_reported_hours/:task_id/:user_id', :controller => 'tasks', :action => 'create_reported_hours', :as => 'create_reported_hours'

  #Github Routes
  match '/github/authorize'   => 'github#authorize' , :method => :get , :as => :github_auth
  match '/github/callback' => 'github#callback' , :method => :get , :as =>  :github_callback

  #Hook Route
  match '/projects/:id/hook' => 'projects#hook', :method => :post , :as => :hook_path

  #resources :project_statuses
  root :to => 'application#home'

  resources :evaluations
  resources :test_cases
  resources :bugs
  resources :roles
  resources :task_users
  resources :labels
  resources :commits
  resources :document_tasks
  resources :goals
  #resources :statuses
  resources :requirement_templates
  resources :requirements
  #resources :use_cases
  #resources :tasks


  resources :projects do
    resources :project_role_users, only: [:new, :create, :destroy]
    resources :document_projects
    member do
      get '/boards/' => 'boards#show' , :as => 'boards'
      post :finish
      #resources :project_role_users
    end
    member do
      post 'tasks/update_status', :controller => 'tasks', :action => 'update_status', :as => 'update_status'
    end
    member do
      post 'statuses/update_order', :controller => 'statuses', :action => 'update_order', :as => 'update_order'
    end
    resources :statuses do
      resources :tasks do
        resources :comments
      end
    end
    resources :use_cases do
      collection do
        get '/template_use_case' => 'use_cases#template_use_case' ,:as => 'template_use_case'
      end
    end
    resources :use_case_templates
  end


    get 'api/v1/getProjects' => 'api#getProjects'
    get 'api/v1/getDocuments' => 'api#getDocuments'
    post 'api/v1/login' => 'api#login'
    delete 'api/v1/logout' => 'api#logout'
    post 'api/v1/upload' => 'api#upload'

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
