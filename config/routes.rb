Tabby::Application.routes.draw do

  resources :permissions

  resources :ko_medication_reviews

  resources :appointments

  resources :ko_medications

  #devise_for :admin_users, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  
  as :user do
    get '/register', to: 'devise/registrations#new', as: :register
    get '/login', to: 'devise/sessions#new', as: :login
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  devise_for :users, skip: [:sessions]

  as :user do
    get "/login" => 'devise/sessions#new', as: :new_user_session
    post "/login" => 'devise/sessions#create', as: :user_session
    delete "/logout" => 'devise/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users, skip: [:sessions] do
    members do
      patch :edit
    end
  end

  get "profiles/show"
  
  resources :catalogs
  resources :statuses
  resources :documents
  resources :trackers
  resources :pages
  resources :goal_posts
  resources :medications
  resources :handshakes
  resources :conditions do
    resources :posts
    get 'privacy'
    resources :trackers
  end
  resources :episodes do
    resources :posts
  end
  resources :weights
  resources :heights
  resources :allergies
  resources :goal_posts
  resources :pictures
  resources :goals do
    resources :goal_posts
    get 'mark_complete'
  end

  resources :users do
    resources :handshakes
    resources :permissions
    resources :trackers
    get 'apps'
    get 'network'
    get 'ecard'
    resources :pictures
    resources :albums do
      resources :pictures
    end
    resources :allergies
    resources :statuses
    resources :goal_posts
    resources :fitnesses
    resources :goals do
      resources :goal_posts
    end
    resources :conditions
    resources :episodes do
      resources :posts
    end
    resources :heights
    resources :weights
    resources :medications
  end
  resources :albums do
    resources :pictures
  end

  resources :user_friendships do
    member do
      put :accept
      put :block
    end
  end
  resources :pictures
  resources :posts

  root 'static_pages#home'
  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/help"
  get "static_pages/community_stats"
  get "static_pages/search"
  get "static_pages/roadmap"

  #Modals
  get "albums/form" => 'albums#form', as: :form



  scope ":profile_name" do
    resources :albums do
      resources :pictures
    end
  end

  get '/:id', to: 'profiles#show', as: 'profile'

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
