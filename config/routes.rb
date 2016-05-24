BrainsUniversity::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :videos, only: [:index, :new, :create, :show]
  resources :comments, :only => [:create, :destroy]
  
  scope :module => "materias" do
    get 'materias', to: 'materias#index', as: '/materias'
    
    resources :estatica, only: [:index] do
      collection do
        get 'equilibrio_cuerpos_rigidos'
      end
    end
    
    resources :termodinamica, only: [:index]
  end

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/users',   to: 'users#show',           via: 'get'
  match '/videos',  to: 'user#index',           via: 'get'
  # match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/landing', to: 'static_pages#landing', via: 'get'
  match '/home',    to: 'static_pages#home', via: 'get'
  

  get "videos/:id/doubts" => 'videos#doubts', :as => :doubts
  post "videos/doubts_mail" => 'videos#doubts_mail', :as => :doubts_mail
  match '/contact',  to: 'static_pages#create',        via: 'post'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

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
