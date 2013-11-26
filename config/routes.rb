  Iic21542::Application.routes.draw do

  get "project_invite/invite"

  get "project_invite/accept"

  get "project_invite/reject"

  get "github/authorize"

  get "github/callback"

  #invitation
  match '/project/:id/invitation' => 'project_invite#invite', :as => 'invite_project'
  match '/project/send_invitation' => 'project_invite#send_invitation', :as =>'send_invitation'
  match '/project/decide_invitation' => 'project_invite#decide', :as =>'decide_invitation_project'
  match '/project/accept_invitation' => 'project_invite#accept', :as =>'accept_invitation_project'
  match '/project/reject_invitation' => 'project_invite#reject', :as =>'reject_invitation_project'
  match '/project/confirm_password_invitation' => 'project_invite#confirm_password_invitation', :as => 'confirm_password_invitation'  
  match '/project/submit_password_invitation' => 'project_invite#submit_password_invitation', :as => 'submit_password_invitation'  
  

  match '/tasks/comments/:id' => 'tasks#show_comments_of_task', :as => 'comments_task'

  get "/tasks/show_comments_of_task"

  # route to getting task for a project
  match 'tasks/project_tasks/:id', :controller =>'tasks' , :action => 'project_tasks'
  match 'statuses/project_tasks/:id', :controller =>'statuses' , :action => 'project_statuses'

  #Dropbox Routes
  match '/dropbox/authorize'   => 'dropbox#authorize' , :method => :get , :as => :dropbox_auth
  match '/dropbox/callback' => 'dropbox#callback' , :method => :get , :as =>  :dropbox_callback

  #Subtasks
  match 'tasks/new_subtask/:status_id/:project_id/:task_id', :controller => 'tasks', :action => 'new_subtask', :as => 'new_subtask'
  post 'tasks/create_subtask/:status_id/:project_id/:task_id', :controller => 'tasks', :action => 'create_subtask', :as => 'create_subtask'
  match 'tasks/delete_subtask/:status_id/:project_id/:sub_task_id', :controller => 'tasks', :action => 'delete_subtask', :as => 'delete_subtask'
  put 'tasks/update_subtask/:status_id/:project_id/:sub_task_id',:controller => 'tasks', :action => 'update_subtask', :as => 'update_subtask'

  #Comments
  put '/projects/:project_id/statuses/:status_id/tasks/:task_id/comments/:id' => 'comments#update', :as => 'update_project_status_task_comment'
  match '/projects/:project_id/statuses/:status_id/tasks/:task_id/comments/:comment_id' => 'comments#delete_comment', :as => 'delete_project_status_task_comment'


  #Github Routes
  match '/github/authorize'   => 'github#authorize' , :method => :get , :as => :github_auth
  match '/github/callback' => 'github#callback' , :method => :get , :as =>  :github_callback

  #Hook Route
  match '/projects/:id/hook' => 'projects#hook', :method => :post , :as => :hook_path
  match '/projects/:project_id/set_hook' => 'projects#set_hook', :method => :get, :as => :set_hook

  #Unlink Github
  match '/projects/:project_id/unlink_github' => 'projects#unlink_github', :as => :unlink_github


  match '/users/notifications' => 'users#notifications', :method => :post, :as => :notifications
  match '/users/notification/:notification_id' => 'users#notification', :method => :post, :as => :notification

  match '/projects/:id/delete_dbtoken' => 'projects#delete_dbtoken', :method => :put, :as => :delete_dbtoken
  
  #resources :project_statuses
  root :to => 'application#home'

  resources :evaluations
  resources :test_cases
  resources :bugs
  resources :roles
  resources :task_users
  resources :labels
  resources :commits
  resources :goals
  resources :requirement_templates

  resources :projects do
    resources :project_role_users, only: [:new, :create, :destroy]
    resources :document_projects
    member do
      get '/boards/' => 'boards#show' , :as => 'boards'
      get '/boards/show_client' => 'boards#show_client', :as => 'boards_client'
      get  :reports_hours_users
      get  :reports_tasks_project
      get  :reports_tasks_user
      get  :reports_use_case
      get  :reports
      post :finish
    end
    member do
      post 'tasks/update_status', :controller => 'tasks', :action => 'update_status', :as => 'update_status'
    end
    member do
      post 'statuses/update_order', :controller => 'statuses', :action => 'update_order', :as => 'update_order'
    end
    member do
      post 'tasks/assign_use_case', :controller => 'tasks', :action => 'assign_use_case', :as => 'assign_use_case'
    end
    resources :statuses do
      resources :tasks do
        member do
          get  :change_lock
          get  :new_reported_hours
          post :create_reported_hours 
        end
        resources :comments
        resources :document_tasks
      end
    end
    resources :use_cases do
      member do
        get :attach_document
        post :add_document      
      end
      member do
        get :requirements
      end
      member do
        get :tasks
      end
      collection do
        get '/template_use_case' => 'use_cases#template_use_case' ,:as => 'template_use_case'
      end
      resources :document_use_cases
    end
    resources :use_case_templates
    resources :use_case_groups
    resources :labels
    resources :requirements do
      member do
        get  :attach_document
        post :add_document
      end
      resources :document_requirements
    end
  end


    get 'api/v1/getProjects' => 'api#getProjects'
    get 'api/v1/getDocuments' => 'api#getDocuments'
    post 'api/v1/login' => 'api#login'
    delete 'api/v1/logout' => 'api#logout'
    post 'api/v1/upload' => 'api#upload'

  #resources :boards

  # resources :users always below devise_for

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions",:omniauth_callbacks => "omniauth_callbacks", :invitations => 'users/invitations'}
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
