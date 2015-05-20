Rails.application.routes.draw do

  devise_for :users, :skip => [:sessions, :registrations]
  as :user do
    get '/admin/login' => 'devise/sessions#new', :as => :new_user_session
    post '/admin/login' => 'devise/sessions#create', :as => :user_session
    delete '/admin/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :admin do
    get '/' => 'admin#index'
    get '/articles/published' => 'articles#published', as: :articles_published
    get '/articles/new' => 'articles#new', as: :article_new
    post '/articles/new' => 'articles#create', as: :article_create
    delete '/articles/:id' => 'articles#delete', as: :article_delete
    post '/articles/:id/publish' => 'articles#publish', as: :article_publish
    post '/articles/:id/unpublish' => 'articles#unpublish', as: :article_unpublish
    get '/articles/:id/edit' => 'articles#edit', as: :article_edit
    post '/articles/:id/edit' => 'articles#update', as: :article_update

  end


  get '/create' => 'articles#create', as: :articles_create
  get '/articles/:id/:slug' => 'articles#show', as: :articles_show
  get '/topics/:slug' => 'topics#show', as: :topics_show
  get '/search' => 'search#index', as: :search
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
