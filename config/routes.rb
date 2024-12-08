Rails.application.routes.draw do
  devise_for :applicant_users
  resources :job_applications

  namespace :api do
    namespace :v1 do
      resources :job_lists
      resources :job_applications
      resources :registrations, only: [:create]
      resources :sessions, only: [:create]
      resource :profile, only: [:show, :update]
    end
  end


  get 'dashboard/index'
  resources :job_lists
  namespace :admin do
      resources :users
      resources :constitutional_governments
      resources :directorates
      resources :natdirectorates
      resources :departments

     

      root to: "users#index"
    end
    
  resources :minister_archives
  resources :constitutional_governments
  resources :user_profiles
  resources :minister_document_forward_department_units
  get 'dashboard_operator_minister/index'
  resources :document_dg_forward_ministers
  resources :minister_document_forward_departments
  resources :minister_document_forward_natdirectorates

  resources :minister_document_forward_directorates
 
  resources :minister_documents do 
    resources :comment_minister_document, as: :comment_minister_documents
  end

  resources :archives
  resources :document_dg_forward_department_units
  get 'dashboard_staff/index'

  resources :document_dg_forward_departments
  get 'dashboard_directorate/index'
  get 'dashboard_directorate/show'
  get 'dashboard_natdirectorate/index'
  get 'dashboard_natdirectorate/show'
  resources :document_dn_forward_departments
  resources :document_from_dns do 
    resources :comment_document_dn, as: :comment_document_dns
  end
  resources :document_from_dgs do 
    resources :comment_document_dg, as: :comment_document_dgs
  end
  resources :document_dg_forward_natdirectorates
  mount RailsAdmin::Engine => '/dbadmin', as: 'rails_admin'
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
    # get 'users' => 'devise/password#edit', :as => 'edit_user_password'
  end
  
  get 'dashboard_minister', to: 'dashboard_minister#index', as: 'dashboard_minister'
  get 'dashboard_minister/view_minister_document/:id' , to: 'dashboard_minister#view_minister_document', as: 'view_minister_document' 
  get 'dashboard_minister/document_dg_minister', to: 'dashboard_minister#document_dg_minister', as: 'document_dg_minister'
  get 'dashboard_minister/view_document_from_dg_minister/:id' , to: 'dashboard_minister#view_document_from_dg_minister', as: 'view_document_from_dg_minister' 
  

  get 'dashboard_operator_minister', to: 'dashboard_operator_minister#index', as: 'dashboard_operator_minister'
  get 'dashboard_operator_minister/view_document_from_dg_op_minister/:id' , to: 'dashboard_operator_minister#view_document_from_dg_op_minister', as: 'view_document_from_dg_op_minister' 
  
  
  get 'dashboard_directorate', to: 'dashboard_directorate#index', as: 'dashboard_directorate'
  get 'dashboard_directorate/view_document_dg/:id' , to: 'dashboard_directorate#view_document_dg', as: 'view_document_dg'
  get 'dashboard_directorate/document_dn'
  get 'dashboard_directorate/view_document_dn/:id' , to: 'dashboard_directorate#view_document_dn', as: 'view_document_dn'
  get 'dashboard_directorate/minister_document_dg', to: 'dashboard_directorate#minister_document_dg', as: 'minister_document_dg'
  get 'dashboard_directorate/view_minister_document_dg/:id' , to: 'dashboard_directorate#view_minister_document_dg', as: 'view_minister_document_dg'
  

  get 'dashboard_operator_directorate', to: 'dashboard_operator_directorate#index', as: 'dashboard_operator_directorate'
  get 'dashboard_operator_directorate/view_minister_doc_op_dg/:id' , to: 'dashboard_operator_directorate#view_minister_doc_op_dg', as: 'view_minister_doc_op_dg'
  
  get 'dashboard_natdirectorate', to: 'dashboard_natdirectorate#index', as: 'dashboard_natdirectorate'
  get 'dashboard_natdirectorate/view_doc_dg/:id' , to: 'dashboard_natdirectorate#view_doc_dg', as: 'view_doc_dg'
  get 'dashboard_natdirectorate/doc_from_dn/' , to: 'dashboard_natdirectorate#doc_from_dn', as: 'doc_from_dn'
  get 'dashboard_natdirectorate/view_doc_from_dn/:id' , to: 'dashboard_natdirectorate#view_doc_from_dn', as: 'view_doc_from_dn'
  get 'dashboard_natdirectorate/minister_document_op_dn/' , to: 'dashboard_natdirectorate#minister_document_op_dn', as: 'minister_document_op_dn'
  get 'dashboard_natdirectorate/view_minister_document_op_dn/:id' , to: 'dashboard_natdirectorate#view_minister_document_op_dn', as: 'view_minister_document_op_dn'

  get 'dashboard_department', to: 'dashboard_department#index', as: 'dashboard_department'
  get 'dashboard_department/view_document_from_dg/:id' , to: 'dashboard_department#view_document_from_dg', as: 'view_document_from_dg'
  get 'dashboard_department/dcmt_from_dn/' , to: 'dashboard_department#dcmt_from_dn', as: 'dcmt_from_dn'
  get 'dashboard_department/view_dcmt_from_dn/:id' , to: 'dashboard_department#view_dcmt_from_dn', as: 'view_dcmt_from_dn'
  get 'dashboard_department/minister_document_dep/' , to: 'dashboard_department#minister_document_dep', as: 'minister_document_dep'
  get 'dashboard_department/view_minister_document_dep/:id' , to: 'dashboard_department#view_minister_document_dep', as: 'view_minister_document_dep'

  get 'dashboard_staff', to: 'dashboard_staff#index', as: 'dashboard_staff'
  get 'dashboard_staff/view_doc_dg_by_staff/:id' , to: 'dashboard_staff#view_doc_dg_by_staff', as: 'view_doc_dg_by_staff'
  get 'dashboard_staff/doc_dn/' , to: 'dashboard_staff#doc_dn', as: 'doc_dn'
  get 'dashboard_staff/view_doc_dn/:id' , to: 'dashboard_staff#view_doc_dn', as: 'view_doc_dn'

  get 'help_dashboard', to: 'help_dashboard#index', as: 'help_dashboard'
  
  resources :dashboard_natdirectorate do 
    # get 'natdirectorate_dashboard', to: 'natdirectorate_dashboard#index', as: 'natdirectorate_dashboard'
    get 'view_document_from_dg'
    get 'show'

  end

  
 
  resources :departments
  resources :natdirectorates
  resources :directorates
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dashboard#index"
end
